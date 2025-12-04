import 'package:atba/models/downloadable_item.dart';
import 'package:atba/models/widgets/downloads_prompt.dart';
import 'package:flutter/material.dart';
import 'package:atba/models/torrent.dart';
import 'package:atba/utils.dart';

class DownloadableItemDetailScreen extends StatelessWidget {
  final DownloadableItem item;
  const DownloadableItemDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SelectableText(item.name, style: TextStyle(fontSize: 24)),
            ),
            SliverToBoxAdapter(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Item Info",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.storage, size: 20),
                          SizedBox(width: 8),
                          Text('Size: ${getReadableSize(item.size)}',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.download, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Status: ${item.downloadState}${item.progress < 1 ? " (${(item.progress * 100).toStringAsFixed(1)}%)" : ""}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      if (item.progress < 1) ...[
                        SizedBox(height: 8),
                        LinearProgressIndicator(value: item.progress),
                        SizedBox(height: 8),
                        Text(
                          'ETA: ${readableTime(item.eta)}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            // Files section for DownloadableItem
            SliverToBoxAdapter(
              child: Text("Files",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            item.files.isEmpty
                ? SliverToBoxAdapter(child: Text("No files found."))
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final file = item.files[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            title: Text(file.name),
                            isThreeLine: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(getReadableSize(file.size)),
                                SizedBox(height: 8),
                                ElevatedButton.icon(
                                  icon: Icon(Icons.download),
                                  label: Text("Download"),
                                  onPressed: () async {
                                    final bool storageGranted =
                                        await showPermissionDialog(context);
                                    if (!storageGranted) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Storage permission is required to download files.'),
                                          ),
                                        );
                                      }
                                      return;
                                    }
                                    final result =
                                        await item.downloadFile(file);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(result?.data != null
                                            ? 'File download started'
                                            : 'Failed to start download'),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: item.files.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
