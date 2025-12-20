import 'package:atba/models/widgets/search_bar.dart';
import 'package:atba/models/widgets/torrent_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atba/services/library_page_state.dart';

class TorrentsList extends StatefulWidget {
  const TorrentsList({super.key});

  @override
  State<TorrentsList> createState() => _TorrentsListState();
}

class _TorrentsListState extends State<TorrentsList> {
  bool _queuedExpanded = false;
  bool _activeExpanded = true;
  bool _inactiveExpanded = true;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LibraryPageState>(context);
    return CustomScrollView(
      slivers: [
        if (state.isSearching)
          DownloadsSearchBar(controller: state.searchController),
        // Queued Torrents
        SliverToBoxAdapter(
          child: ListTile(
            title: Text('${state.queuedTorrents.length} Queued Torrents'),
            onTap: () => setState(() => _queuedExpanded = !_queuedExpanded),
            trailing:
                Icon(_queuedExpanded ? Icons.expand_less : Icons.expand_more),
          ),
        ),
        if (_queuedExpanded)
          SliverList(
            delegate: SliverChildListDelegate(
              state.queuedTorrents
                  .map((torrent) => QueuedTorrentWidget(torrent: torrent))
                  .toList(),
            ),
          ),

        // Active Torrents
        SliverToBoxAdapter(
          child: ListTile(
            title: Text(state.filteredSortedActiveTorrents.length ==
                    state.activeTorrents.length
                ? '${state.activeTorrents.length} Active Torrents'
                : '${state.filteredSortedActiveTorrents.length}/${state.activeTorrents.length} Active Torrents'),
            onTap: () => setState(() => _activeExpanded = !_activeExpanded),
            trailing:
                Icon(_activeExpanded ? Icons.expand_less : Icons.expand_more),
          ),
        ),
        if (_activeExpanded)
          SliverList(
            delegate: SliverChildListDelegate(
              state.filteredSortedActiveTorrents
                  .map((torrent) => TorrentWidget(torrent: torrent))
                  .toList(),
            ),
          ),

        // Inactive Torrents
        SliverToBoxAdapter(
          child: ListTile(
            title: Text(state.filteredSortedInactiveTorrents.length ==
                    state.inactiveTorrents.length
                ? '${state.inactiveTorrents.length} Inactive Torrents'
                : '${state.filteredSortedInactiveTorrents.length}/${state.inactiveTorrents.length} Inactive Torrents'),
            onTap: () => setState(() => _inactiveExpanded = !_inactiveExpanded),
            trailing:
                Icon(_inactiveExpanded ? Icons.expand_less : Icons.expand_more),
          ),
        ),
        if (_inactiveExpanded)
          SliverList(
            delegate: SliverChildListDelegate(
              state.filteredSortedInactiveTorrents
                  .map((torrent) => TorrentWidget(torrent: torrent))
                  .toList(),
            ),
          ),
      ],
    );
  }
}
