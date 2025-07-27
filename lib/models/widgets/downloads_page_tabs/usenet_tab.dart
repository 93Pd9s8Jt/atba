import 'dart:ui';

import 'package:atba/models/widgets/downloadable_item_widget.dart';
import 'package:atba/services/downloads_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsenetTab extends StatelessWidget {
  final DownloadsPageState state;

  const UsenetTab({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await state.refreshUsenet(bypassCache: true);
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: FutureBuilder(
          future: state.usenetFuture,
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
                                  ScaffoldMessenger.of(context).showSnackBar(
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

              return state.usenetDownloads.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.filteredSortedUsenetDownloads.length,
                      itemBuilder: (context, index) {
                        final download =
                            state.filteredSortedUsenetDownloads[index];
                        return DownloadableItemWidget(
                          item: download,
                        );
                      },
                    )
                  : const Center(child: Text('No usenet downloads available'));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
