import 'package:atba/models/widgets/downloads_page_tabs/torrents_tab.dart';
import 'package:atba/models/widgets/downloads_page_tabs/web_downloads_tab.dart';
import 'package:atba/models/widgets/downloads_page_tabs/usenet_tab.dart';
import 'package:atba/models/widgets/downloads_page_tabs/add_tabs.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atba/services/downloads_page_state.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DownloadsPageState(context),
      child: Consumer<DownloadsPageState>(
        builder: (context, state, child) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: (state.isSelecting)
                    ? Text("${state.selectedTorrents.length} selected")
                    : null,
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Torrents'),
                    Tab(text: 'Web'),
                    Tab(text: 'Usenet'),
                  ],
                ),
                actions: [
                  if (state.isSelecting)
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.select_all),
                          onPressed: () {
                            state.selectAllTorrents();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.flip),
                          onPressed: () {
                            state.invertSelection();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            state.clearSelection();
                          },
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        // reimplment popup menu with MenuAnchor
                        // animation issues due to https://github.com/flutter/flutter/issues/143781
                        // TODO: so we will need to manually implement animations
                        MenuAnchor(
                          builder: (BuildContext context, MenuController controlller, Widget? child) {
                            return IconButton(
                              icon: const Icon(Icons.sort),
                              onPressed: () {
                                if (controlller.isOpen) {
                                  controlller.close();
                                } else {
                                  controlller.open();
                                }
                              },
                              tooltip: "Sort downloads",
                            );
                          },
                          menuChildren: List<MenuItemButton>.generate(
                            DownloadsPageState.sortingOptions.length,
                            (int index) => MenuItemButton(
                              onPressed: () {
                                state.updateSortingOption(
                                    DownloadsPageState.sortingOptions.keys
                                        .elementAt(index));
                                    // Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Text(DownloadsPageState.sortingOptions.keys
                                      .elementAt(index)),
                                  if (state.selectedSortingOption ==
                                      DownloadsPageState.sortingOptions.keys
                                          .elementAt(index))
                                    Row(
                                      children: [
                                        SizedBox(width: 4),
                                        Icon(Icons.check,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          )
                        ),
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () => _showFilterBottomSheet(context),
                        ),
                        IconButton(
                          icon: state.isTorrentNamesCensored
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            state.toggleTorrentNamesCensoring();
                          },
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.search),
                        //   onPressed: () {
                        //     // Implement search functionality here.
                        //   },
                        // )
                      ],
                    ),
                ],
              ),
              body: TabBarView(
                children: [
                  buildTorrentsTab(state, context),
                  WebDownloadsTab(state: state),
                  UsenetTab(state: state),
                ],
              ),
              floatingActionButton: state.isSelecting
                  ? SizedBox.shrink()
                  : FloatingActionButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const FullscreenMenu().animate().scale(
                                curve: Curves.easeIn,
                                duration: Duration(milliseconds: 250));
                          },
                        );
                      },
                      child: const Icon(Icons.add),
                    ),
            ),
          );
        },
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context2) {
        return ChangeNotifierProvider<DownloadsPageState>.value(
            value: context.watch<DownloadsPageState>(),
            builder: (context, _) {
              return Theme(
                data: Theme.of(context).copyWith(),
                child: StatefulBuilder(
                  builder: (BuildContext _, StateSetter setState) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ListTile(
                            title: Text('Main'),
                          ),
                          _buildMainFilters(context, setState),
                          // const ListTile(title: Text("Qualities")),
                          // _buildQualityFilters(context, setState),
                        ],
                      ),
                    );
                  },
                ),
              );
            });
      },
    );
  }

  Widget _buildMainFilters(BuildContext context, StateSetter setState) {
    return Consumer<DownloadsPageState>(
      builder: (context, state, child) {
        return Wrap(
          spacing: 8.0,
          children: DownloadsPageState.filters.keys.map((filter) {
            return FilterChip(
              label: Text(filter, style: const TextStyle(fontSize: 12)),
              selected: state.selectedMainFilters.contains(filter),
              onSelected: (selected) {
                setState(() {
                  state.updateFilter(filter, selected);
                });
              },
              showCheckmark: false,
            );
          }).toList(),
        );
      },
    );
  }
}

