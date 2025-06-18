import 'dart:math';

import 'package:atba/models/torrent.dart';
import 'package:atba/models/widgets/torrent_widget.dart';
import 'package:atba/services/downloads_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
import 'package:either_dart/either.dart';
import 'package:provider/provider.dart';

class CollapsibleSection extends StatefulWidget {
  final String title;
  final List<Either<Torrent, QueuedTorrent>>
      children; // List<Torrent> or List<QueuedTorrent>
  final GlobalKey listKey;
  final bool initiallyExpanded;

  const CollapsibleSection({
    super.key,
    required this.title,
    required this.children,
    required this.listKey,
    this.initiallyExpanded = false,
  });

  @override
  _CollapsibleSectionState createState() => _CollapsibleSectionState();
}

class _CollapsibleSectionState extends State<CollapsibleSection> {
  late bool isInitiallyExpanded;

  @override
  void initState() {
    super.initState();
    isInitiallyExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: isInitiallyExpanded,
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 16.0),
      ),
      children: [
        if (widget.children.isEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'No items available',
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
          )
        else
        Container(
          constraints:BoxConstraints(maxHeight: double.tryParse(Settings.getValue<String>("collapsible-sections-max-height", defaultValue: "350")!) ?? 350),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ImplicitlyAnimatedReorderableList<Either<Torrent, QueuedTorrent>>(

              key: widget.listKey,
              items: widget.children,
              areItemsTheSame: (oldItem, newItem) =>
                  oldItem.fold((t) => t.id, (qt) => qt.id) ==
                  newItem.fold((t) => t.id, (qt) => qt.id),
              onReorderFinished: (item, from, to, newItems) {
                Provider.of<DownloadsPageState>(context, listen: false).handleReorder(
                    widget.listKey, 
                    item,
                    from,
                    to,
                    newItems);
              },
              itemBuilder: (context, itemAnimation, item, index) {
                return Reorderable(
                  key: ValueKey(item.fold((torrent) => torrent.id,
                      (queuedTorrent) => queuedTorrent.id)),
                  builder: (context, dragAnimation, inDrag) {
                    return SizeFadeTransition(
                      sizeFraction: 0.7,
                      curve: Curves.easeInOut,
                      animation: itemAnimation,
                      child: item.fold(
                        (torrent) => TorrentWidget(torrent: torrent),
                        (queuedTorrent) =>
                            QueuedTorrentWidget(torrent: queuedTorrent),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
