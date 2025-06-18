import 'package:atba/models/widgets/torrentlist.dart';
import 'package:atba/services/downloads_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

RefreshIndicator buildTorrentsTab(
    DownloadsPageState state, BuildContext context) {
  return RefreshIndicator(
    onRefresh: () async {
      await state.refreshTorrents(bypassCache: true);
    },
    child: Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: state.torrentsFuture,
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
                              : SizedBox(),
                              
                        ],
                      )));
                }

                return state.activeTorrents.isNotEmpty || state.inactiveTorrents.isNotEmpty || state.queuedTorrents.isNotEmpty ?  TorrentsList() : const Center(
                    child: Text('No torrents available'),
                  );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    ),
  );
}

