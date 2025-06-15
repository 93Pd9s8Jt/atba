
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:atba/models/torrent.dart';
import 'package:atba/models/widgets/collapsible_section.dart';
import 'package:provider/provider.dart';
import 'package:atba/services/downloads_page_state.dart';

class TorrentsList extends StatefulWidget {

  const TorrentsList({
    super.key,
  });

  @override
  TorrentsListState createState() => TorrentsListState();
}

class TorrentsListState extends State<TorrentsList> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DownloadsPageState>(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CollapsibleSection(
            title: '${state.queuedTorrents.length} Queued Torrents',
            initiallyExpanded: false,
            listKey: state.animatedQueuedTorrentsListKey,
            children: state.sortedQueuedTorrents.map((queuedTorrent) => Right<Torrent, QueuedTorrent>(queuedTorrent)).toList(),
          ),
        ),
        SliverToBoxAdapter(
          child: CollapsibleSection(
            title: state.filteredSortedActiveTorrents.length == state.activeTorrents.length ? '${state.activeTorrents.length} Active Torrents' :'${state.filteredSortedActiveTorrents.length}/${state.activeTorrents.length} Active Torrents',
            initiallyExpanded: true,
            listKey: state.animatedActiveTorrentsListKey,
            children: state.filteredSortedActiveTorrents.map((torrent) => Left<Torrent, QueuedTorrent>(torrent)).toList(),
          ),
        ),
        SliverToBoxAdapter(
          child: CollapsibleSection(
            title: state.filteredSortedInactiveTorrents.length == state.inactiveTorrents.length ? '${state.inactiveTorrents.length} Inactive Torrents' :'${state.filteredSortedInactiveTorrents.length}/${state.inactiveTorrents.length} Inactive Torrents',
            initiallyExpanded: true,
            listKey: state.animatedInactiveTorrentsListKey,
            children:  state.filteredSortedInactiveTorrents.map((torrent) => Left<Torrent, QueuedTorrent>(torrent)).toList(),
          ),
        ),
      ],
    );
  }
}


