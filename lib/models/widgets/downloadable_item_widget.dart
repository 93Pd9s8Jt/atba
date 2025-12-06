import 'dart:ui';

import 'package:atba/models/downloadable_item.dart';
import 'package:atba/models/torrent.dart';
import 'package:atba/models/widgets/downloadable_item_detail_screen.dart';
import 'package:atba/services/library_page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DownloadableItemWidget extends StatelessWidget {
  final DownloadableItem item;

  const DownloadableItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DownloadsPageState>(context);
    final isSelected = state.selectedItems.any((selectedItem) => selectedItem.id == item.id);
    final isCensored = state.isTorrentNamesCensored;

    void handleTap() {
          if (state.isSelecting) {
            state.toggleSelection(item);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DownloadableItemDetailScreen(item: item),
              ),
            );
          }
        }

    return Container(
      color: isSelected ? Theme.of(context).highlightColor : Colors.transparent,
      child: ListTile(
        title: ImageFiltered(
            enabled: isCensored,
            imageFilter: ImageFilter.blur(
              sigmaX: 6,
              sigmaY: 6,
              tileMode: TileMode.decal,
            ),
            child: SelectableText(item.name, onTap: handleTap,)),
        subtitle: () {
          // switch neeeds to be wrapped in an instantly invoked function expression
          switch (item.itemStatus) {
            case DownloadableItemStatus.loading:
              return Text('Loading...');
            case DownloadableItemStatus.error:
              return Text(item.errorMessage ?? 'Error loading item');
            case DownloadableItemStatus.success:
              return Text("Success");
            default:
              return Text(item.downloadState);
          }
        }(),
        trailing: Text(getReadableSize(item.size)),
        onLongPress: () {
          state.startSelection(item);
        },
        onTap: handleTap,
      ),
    );
  }
}
