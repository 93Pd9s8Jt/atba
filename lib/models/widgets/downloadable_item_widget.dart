import 'package:atba/models/downloadable_item.dart';
import 'package:atba/services/downloads_page_state.dart';
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
    final isSelected =
        Provider.of<DownloadsPageState>(context).selectedItems.contains(item);
    return Container(
      color: isSelected ? Theme.of(context).highlightColor : Colors.transparent,
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(item.downloadState),
        onLongPress: () {
          Provider.of<DownloadsPageState>(context, listen: false)
              .startSelection(item);
        },
        onTap: () {
          Provider.of<DownloadsPageState>(context, listen: false)
              .toggleSelection(item);
        },
      ),
    );
  }
}
