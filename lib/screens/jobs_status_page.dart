import 'package:atba/models/torbox_api_response.dart';
import 'package:atba/services/jobs_update_service.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:atba/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';

class JobsStatusPage extends StatefulWidget {
  const JobsStatusPage({super.key});

  @override
  State<JobsStatusPage> createState() => _JobsStatusPageState();
}

class _JobsStatusPageState extends State<JobsStatusPage> {
  List<JobQueueItem>? _jobs;
  Set<JobQueueItem> _selectedJobs = {};
  bool _isSelecting = false;
  late final JobsUpdateService updateService;

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
        actions: _isSelecting ? [_buildDeleteIcon()] : [],
      ),
      body: _jobs == null
          ? const Center(child: CircularProgressIndicator())
          : _jobs!.isEmpty
          ? const Center(child: Text('No jobs found.'))
          : ListView.builder(
              itemCount: _jobs!.length,
              itemBuilder: (context, index) {
                final job = _jobs![index];
                return Container(
                  color: _selectedJobs.contains(job)
                      ? Theme.of(context).highlightColor
                      : Colors.transparent,
                  child: ListTile(
                    leading: job.isLoading ? CircularProgressIndicator() : getStatusIcon(job.data.status),
                    title: Text(
                      job.data.fileName?.split("/").last ?? job.data.id.toString(),
                    ),
                    subtitle: job.data.status == JobQueueStatus.uploading ?
                    LinearProgressIndicator(value: job.data.progress.toDouble())
                    : Text(job.data.detail),
                    trailing: Text(
                      formatTimeDifference(
                        DateTime.now().difference(job.data.createdAt),
                      ),
                    ),
                    onTap: () => {
                      if (_isSelecting)
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
          .map((jobJson) => JobQueueItem(data: JobQueueStatusResponse.fromJson(jobJson)))
          .toList();
    });
    if (_jobs == null) return;
    _jobs!
        .where(
          (j) =>
              !JobsUpdateService.doneStatuses.contains(j.data.status)
        )
        .forEach((j) => startPeriodicUpdate(j.data.id));
  }

  void startPeriodicUpdate(int jobId) {
    final stream = updateService.monitorJob(jobId);

    stream.listen(
      (json) {
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
      },
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

  JobQueueItem({
    required this.data
  });

  void setIsLoading(bool val) {
    _isLoading = val;
  }

  bool get isLoading => _isLoading;
}