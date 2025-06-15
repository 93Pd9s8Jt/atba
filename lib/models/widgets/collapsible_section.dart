import 'dart:math';

import 'package:atba/models/torrent.dart';
import 'package:atba/models/widgets/torrent_widget.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
import 'package:either_dart/either.dart';

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
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16.0),
                ),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
              ],
            ),
          ),
        ),
        ClipRect(
          child: AnimatedCrossFade(
            firstChild: Container(),
            secondChild: ImplicitlyAnimatedReorderableList<
                Either<Torrent, QueuedTorrent>>(
                  shrinkWrap: true,
              items: widget.children,
              areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
              onReorderFinished: (item, from, to, newItems) {
                setState(() {
                  widget.children
                    ..clear()
                    ..addAll(newItems);
                });
              },
              itemBuilder: (context, itemAnimation, item, index) {
                return Reorderable(
                  key: ValueKey(item),
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
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(
                milliseconds:
                    (200 + log(widget.children.length + 1).round() * 50)
                        .toInt()),
            firstCurve: Curves.easeOut,
            secondCurve: Curves.easeIn,
          ),
        ),
        Divider(),
      ],
    );
  }
}
