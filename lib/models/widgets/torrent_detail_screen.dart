import 'package:atba/models/torrent.dart';
import 'package:atba/models/widgets/downloads_prompt.dart';
import 'package:atba/screens/jobs_status_page.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:atba/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class TorrentDetailScreen extends StatelessWidget {
  final Torrent torrent;
  const TorrentDetailScreen({super.key, required this.torrent});

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<TorboxAPI>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SelectableText(
                torrent.name,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SliverToBoxAdapter(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Torrent Info",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.link, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: FutureBuilder(
                              future: torrent.exportAsMagnet(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text("Loading magnet...");
                                } else if (snapshot.hasError ||
                                    snapshot.data?.data == null) {
                                  return Text(
                                    "Error loading magnet: ${snapshot.data?.detailOrUnknown}",
                                  );
                                } else {
                                  return GestureDetector(
                                    onTap: () async {
                                      final String? magnet =
                                          snapshot.data?.data as String?;
                                      if (magnet == null) return;
                                      Clipboard.setData(
                                        ClipboardData(text: magnet),
                                      );
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Magnet link copied to clipboard',
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text(
                                      snapshot.data?.data as String? ?? "",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.storage, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Size: ${getReadableSize(torrent.size)}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.download, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Status: ${torrent.downloadState}${torrent.progress < 1 ? " (${(torrent.progress * 100).toStringAsFixed(1)}%)" : ""}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      if (torrent.progress < 1) ...[
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.group, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Seeds: ${torrent.seeds} | Peers: ${torrent.peers}',
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        LinearProgressIndicator(value: torrent.progress),
                        SizedBox(height: 8),
                        Text(
                          'ETA: ${readableTime(torrent.eta)}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                      // Download with integrations (google drive, etc)
                      if (apiService.googleToken != null &&
                          apiService.googleToken!.isNotEmpty) ...[
                        SizedBox(height: 16),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              icon: Icon(FontAwesome.google_drive_brand),
                              label: Text("Download with Google Drive"),
                              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.onSecondary),
                              onPressed: () async {
                                final response = await apiService
                                    .queueIntegration(
                                      QueueableIntegration.google,
                                      torrent.id,
                                      zip: true,
                                      type: IntegrationFileType.torrent,
                                    );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        response.success
                                            ? 'Torrent queued for Google Drive'
                                            : 'Failed to queue torrent: ${response.detailOrUnknown}',
                                      ),
                                      action: response.success
                                          ? SnackBarAction(
                                              label: "View",
                                              onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      JobsStatusPage(),
                                                ),
                                              ),
                                            )
                                          : null,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Files",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            torrent.files.isEmpty
                ? SliverToBoxAdapter(child: Text("No files found."))
                : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final file = torrent.files[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          title: Text(file.name),
                          // Move the button below the text instead of trailing
                          isThreeLine: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          // Remove trailing, add button below
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(getReadableSize(file.size)),
                              SizedBox(height: 8),
                              FittedBox(
                                child: Row(
                                  children: [
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.download),
                                      label: Text("Download"),
                                      style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.onSecondary),
                                      onPressed: () async {
                                        // Implement your file download logic here
                                        // For example:
                                        final bool storageGranted =
                                            await showPermissionDialog(context);
                                        if (!storageGranted) {
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Storage permission is required to download files.',
                                                ),
                                              ),
                                            );
                                          }
                                          return;
                                        }
                                        final result = await torrent
                                            .downloadFile(file);
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              result.data != null
                                                  ? 'File download started'
                                                  : 'Failed to start download',
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    if (apiService.googleToken != null &&
                                        apiService.googleToken!.isNotEmpty) ...[
                                      SizedBox(width: 8),
                                      ElevatedButton.icon(
                                        icon: Icon(
                                          FontAwesome.google_drive_brand,
                                        ),
                                        label: Text("Google Drive"),
                                        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.onSecondary),
                                        onPressed: () async {
                                          final response = await apiService
                                              .queueIntegration(
                                                QueueableIntegration.google,
                                                torrent.id,
                                                fileId: file.id,
                                                zip: false,
                                                type:
                                                    IntegrationFileType.torrent,
                                              );
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  response.success
                                                      ? 'File queued for Google Drive'
                                                      : 'Failed to queue file: ${response.detailOrUnknown}',
                                                ),
                                                action: response.success
                                                    ? SnackBarAction(
                                                        label: "View",
                                                        onPressed: () =>
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        JobsStatusPage(),
                                                              ),
                                                            ),
                                                      )
                                                    : null,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }, childCount: torrent.files.length),
                  ),
          ],
        ),
      ),
    );
  }
}
