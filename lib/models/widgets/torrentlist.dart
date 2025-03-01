import 'dart:math';

import 'package:atba/models/widgets/torrent_widget.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:atba/models/torrent.dart';
import 'package:atba/models/widgets/collapsible_section.dart';
import 'package:provider/provider.dart';
import 'package:atba/services/downloads_page_state.dart';

class TorrentsList extends StatefulWidget {
  final List<Torrent> activeTorrents;
  final List<QueuedTorrent> queuedTorrents;
  final List<Torrent> inactiveTorrents;

  const TorrentsList({
    super.key,
    required this.activeTorrents,
    required this.queuedTorrents,
    required this.inactiveTorrents,
  });

  @override
  TorrentsListState createState() => TorrentsListState();
}

class TorrentsListState extends State<TorrentsList> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DownloadsPageState>(context);
    final sortedActiveTorrents = List<Torrent>.from(widget.activeTorrents);
    final sortedInactiveTorrents = List<Torrent>.from(widget.inactiveTorrents);
    state.sortTorrents(sortedActiveTorrents);
    state.sortTorrents(sortedInactiveTorrents);
    state.filterTorrents(sortedActiveTorrents);
    state.filterTorrents(sortedInactiveTorrents);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CollapsibleSection(
            title: '${widget.queuedTorrents.length} Queued Torrents',
            initiallyExpanded: false,
            children: widget.queuedTorrents
                .map((torrent) => QueuedTorrentWidget(torrent: torrent))
                .toList(),
          ),
        ),
        SliverToBoxAdapter(
          child: CollapsibleSection(
            title: sortedActiveTorrents.length == widget.activeTorrents.length ? '${widget.activeTorrents.length} Active Torrents' :'${sortedActiveTorrents.length}/${widget.activeTorrents.length} Active Torrents',
            initiallyExpanded: true,
            children: sortedActiveTorrents
                .map((torrent) => TorrentWidget(torrent: torrent))
                .toList(),
          ),
        ),
        SliverToBoxAdapter(
          child: CollapsibleSection(
            title: sortedInactiveTorrents.length == widget.inactiveTorrents.length ? '${widget.inactiveTorrents.length} Inactive Torrents' :'${sortedInactiveTorrents.length}/${widget.inactiveTorrents.length} Inactive Torrents',
            initiallyExpanded: true,
            children: sortedInactiveTorrents
                .map((torrent) => TorrentWidget(torrent: torrent))
                .toList(),
          ),
        ),
      ],
    );
  }
}


