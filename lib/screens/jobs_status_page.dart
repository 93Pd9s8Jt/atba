import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/jobs_update_service.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:atba/utils.dart';
import 'package:atba/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';

class JobsStatusPage extends StatefulWidget {
  const JobsStatusPage({super.key});

  @override
  State<JobsStatusPage> createState() => _JobsStatusPageState();
}

class _JobsStatusPageState extends State<JobsStatusPage> {
  List<JobQueueItem>? _jobs;
  List<JobQueueItem>? get _sortedJobs => _getSortedJobs();
  final Set<JobQueueItem> _selectedJobs = {};
  bool _isSelecting = false;
  late final JobsUpdateService updateService;

  static String _selectedSortingOption = Settings.getValue<String>(Constants.jobQueueSelectedSort, defaultValue: "Default")!;

  static final Map<String, int Function(JobQueueItem, JobQueueItem)>
  _sortingFunctions = {
    "Default": (a, b) => 0,
    "A to Z": (a, b) => -(a.data.fileName ?? a.data.id.toString()).compareTo(
      b.data.fileName ?? b.data.id.toString(),
    ),
    "Z to A": (a, b) => (a.data.fileName ?? a.data.id.toString()).compareTo(
      b.data.fileName ?? b.data.id.toString(),
    ),
    "Newest": (a, b) => -a.data.createdAt.compareTo(b.data.createdAt),
    "Oldest": (a, b) => a.data.createdAt.compareTo(b.data.createdAt),
    "Type": (a, b) => a.data.type.compareTo(b.data.type),
    "Progress": (a, b) => a.data.progress.compareTo(b.data.progress),
  };

  List<JobQueueItem>? _getSortedJobs() {
    if (_jobs == null) return null;
    return _jobs!.toList()..sort(_sortingFunctions[_selectedSortingOption]);
  }

  @override
  void initState() {
    super.initState();
    _fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs Status'),
        actions: _isSelecting ? [_buildDeleteIcon(), _buildFilterButton()] : [_buildFilterButton()],
      ),
      body: _jobs == null
          ? const Center(child: CircularProgressIndicator())
          : _jobs!.isEmpty
          ? const Center(child: Text('No jobs found.'))
          : ListView.builder(
              itemCount: _jobs!.length,
              itemBuilder: (context, index) {
                final job = _sortedJobs![index];
                return Container(
                  color: _selectedJobs.contains(job)
                      ? Theme.of(context).highlightColor
                      : Colors.transparent,
                  child: ListTile(
                    leading: job.isLoading
                        ? CircularProgressIndicator()
                        : getStatusIcon(job.data.status),
                    title: Text(
                      job.data.fileName?.split("/").last ??
                          job.data.id.toString(),
                    ),
                    subtitle: job.data.status == JobQueueStatus.uploading
                        ? LinearProgressIndicator(
                            value: job.data.progress.toDouble(),
                          )
                        : Text(job.data.detail),
                    trailing: Text(
                      formatTimeDifference(
                        DateTime.now().difference(job.data.createdAt),
                      ),
                    ),
                    onTap: () => {
                      if (_isSelecting) {
                        if (_selectedJobs.contains(job))
                          {
                            setState(() {
                              _selectedJobs.remove(job);
                              if (_selectedJobs.isEmpty) _isSelecting = false;
                            }),
                          }
                        else
                          {
                            setState(() {
                              _selectedJobs.add(job);
                            }),
                          },
                      } else {

                      }
                    },
                    onLongPress: () {
                      if (_isSelecting) {
                        if (_selectedJobs.contains(job)) {
                          setState(() {
                            _selectedJobs.remove(job);
                            if (_selectedJobs.isEmpty) _isSelecting = false;
                          });
                        } else {
                          setState(() {
                            _selectedJobs.add(job);
                          });
                        }
                      } else {
                        setState(() {
                          _isSelecting = true;
                          _selectedJobs.add(job);
                        });
                      }
                    },
                  ),
                );
              },
            ),
    );
  }

  Future<void> _fetchJobs() async {
    final apiService = Provider.of<TorboxAPI>(context, listen: false);
    updateService = JobsUpdateService(apiService);
    final response = await apiService.getAllJobs();
    setState(() {
      _jobs = (response.data as List)
          .map(
            (jobJson) =>
                JobQueueItem(data: JobQueueStatusResponse.fromJson(jobJson)),
          )
          .toList();
    });
    if (_jobs == null) return;
    _jobs!
        .where((j) => !JobsUpdateService.doneStatuses.contains(j.data.status))
        .forEach((j) => startPeriodicUpdate(j.data.id));
  }

  void startPeriodicUpdate(int jobId) {
    final stream = updateService.monitorJob(jobId);

    stream.listen((json) {
      final index = _jobs!.indexWhere((j) => j.data.id == jobId);
      if (json["type"] == "updating") {
        setState(() {
          _jobs![index].setIsLoading(true);
        });

        return;
      }
      // Find the item in temporary list and update it.
      JobQueueItem updatedJob = JobQueueItem(data: json["updatedItem"]);
      if (index != -1) {
        setState(() {
          _jobs![index] = updatedJob;
        });
      } else {
        setState(() {
          _jobs!.add(updatedJob);
        });
      }
    });
  }

  Widget _buildFilterButton() {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controlller, Widget? child) {
            return IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () {
                if (controlller.isOpen) {
                  controlller.close();
                } else {
                  controlller.open();
                }
              },
              tooltip: "Sort downloads",
            );
          },
      menuChildren: List<MenuItemButton>.generate(
        _sortingFunctions.length,
        (int index) => MenuItemButton(
          onPressed: () async {
            setState(() => _selectedSortingOption = _sortingFunctions.keys.elementAt(index));
            await Settings.setValue(Constants.jobQueueSelectedSort, _selectedSortingOption);
            // Navigator.pop(context);
          },
          child: Row(
            children: [
              Text(_sortingFunctions.keys.elementAt(index)),
              if (_selectedSortingOption ==
                  _sortingFunctions.keys.elementAt(index))
                Row(
                  children: [
                    SizedBox(width: 4),
                    Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteIcon() {
    final apiService = Provider.of<TorboxAPI>(context, listen: false);

    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: () async {
        for (final job in _selectedJobs.toSet()) {
          await apiService.cancelJobById(job.data.id);
          setState(() => _jobs!.remove(job));
        }
        setState(() {
          _selectedJobs.clear();
          _isSelecting = false;
        });
      },
    );
  }

  Widget getStatusIcon(JobQueueStatus status) {
    final IconData iconData = getIcon(status);
    switch (status) {
      case JobQueueStatus.pending:
        return Icon(iconData, color: Colors.grey);
      case JobQueueStatus.completed:
        return Icon(iconData, color: Colors.green);
      case JobQueueStatus.failed:
        return Icon(iconData, color: Colors.red);
      case JobQueueStatus.uploading:
        return Icon(iconData, color: Colors.blue);
      case JobQueueStatus.preparing:
        return Icon(iconData, color: Colors.grey);
    }
  }

  IconData getIcon(JobQueueStatus status) {
    return FontAwesome.google_drive_brand;
  }
}

class JobQueueItem {
  final JobQueueStatusResponse data;
  bool _isLoading = false;

  JobQueueItem({required this.data});

  void setIsLoading(bool val) {
    _isLoading = val;
  }

  bool get isLoading => _isLoading;
}
