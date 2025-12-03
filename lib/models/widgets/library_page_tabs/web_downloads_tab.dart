import 'package:atba/models/widgets/downloadable_item_widget.dart';
import 'package:atba/models/widgets/search_bar.dart';
import 'package:atba/services/library_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WebDownloadsTab extends StatelessWidget {
  final DownloadsPageState state;

  const WebDownloadsTab({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (state.isSearching)
          DownloadsSearchBar(
            controller: state.searchController,
          ),
        SliverFillRemaining(
          child: RefreshIndicator(
            key: state.webRefreshIndicatorKey,
            onRefresh: () async {
              await state.refreshWebDownloads(bypassCache: true);
            },
            child: FutureBuilder(
              future: state.webDownloadsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as Map<String, dynamic>;
                  if (data.containsKey("success") && data["success"] != true) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text('Failed to fetch data: ${data["detail"]}',
                                style: const TextStyle(color: Colors.red)),
                            data["stackTrace"] != null
                                ? ElevatedButton(
                                    child: const Text('Copy stack trace'),
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text: data["stackTrace"].toString()));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Stack trace copied to clipboard'),
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    );
                  }
                  return state.filteredSortedWebDownloads.isNotEmpty
                      ? ListView.builder(
                          physics: const ScrollPhysics(),
                          itemCount: state.filteredSortedWebDownloads.length,
                          itemBuilder: (context, index) {
                            final download =
                                state.filteredSortedWebDownloads[index];
                            return DownloadableItemWidget(item: download);
                          },
                        )
                      : const Center(child: Text('No web downloads available'));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
