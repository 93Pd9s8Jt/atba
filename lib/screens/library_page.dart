import 'package:atba/models/widgets/downloads_prompt.dart';
import 'package:atba/screens/jobs_status_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:atba/models/torrent.dart';
import 'package:atba/config/constants.dart';
import 'package:atba/models/widgets/library_page_tabs/torrents_tab.dart';
import 'package:atba/models/widgets/library_page_tabs/web_downloads_tab.dart';
import 'package:atba/models/widgets/library_page_tabs/usenet_tab.dart';
import 'package:atba/models/widgets/library_page_tabs/add_tabs.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:atba/services/library_page_state.dart';
import 'package:icon_craft/icon_craft.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _hasBeenViewedOnce = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<TorboxAPI>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => LibraryPageState(context),
      child: Consumer<LibraryPageState>(
        builder: (context, state, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (!_hasBeenViewedOnce &&
                Settings.getValue<bool>(
                  Constants.useCache,
                  defaultValue: true,
                )! &&
                Settings.getValue<bool>(
                  Constants.loadUncachedLibraryOnStart,
                  defaultValue: true,
                )! &&
                (await state.isCacheNotEmpty())) {
              _hasBeenViewedOnce = true;
              state.onLibraryPageFirstView();
            }
          });
          return Scaffold(
            appBar: AppBar(
              title: (state.isSelecting)
                  ? Text("${state.selectedItems.length} selected")
                  : null,
              bottom: TabBar(
                controller: _tabController,
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
                          state.selectAllItems();
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
                      if (Settings.getValue(
                        Constants.showJobsStatusShortcut,
                        defaultValue: true,
                      )!)
                        IconButton(
                          icon: const Icon(Icons.work),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const JobsStatusPage(),
                              ),
                            );
                          },
                          tooltip: "Jobs Status",
                        ),
                      if (Settings.getValue(
                        Constants.showRefreshIcon,
                        defaultValue: true,
                      )!)
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () {
                            state.torrentRefreshIndicatorKey.currentState
                                ?.show();
                            state.webRefreshIndicatorKey.currentState?.show();
                            state.usenetRefreshIndicatorKey.currentState
                                ?.show();
                          },
                        ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          state.toggleSearch();
                        },
                        tooltip: "Search",
                      ),
                      // reimplement popup menu with MenuAnchor
                      // animation issues due to https://github.com/flutter/flutter/issues/143781
                      // TODO: so we will need to manually implement animations
                      MenuAnchor(
                        builder:
                            (
                              BuildContext context,
                              MenuController controlller,
                              Widget? child,
                            ) {
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
                          LibraryPageState.sortingOptions.length,
                          (int index) => MenuItemButton(
                            onPressed: () {
                              state.updateSortingOption(
                                LibraryPageState.sortingOptions.keys.elementAt(
                                  index,
                                ),
                              );
                              // Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Text(
                                  LibraryPageState.sortingOptions.keys
                                      .elementAt(index),
                                ),
                                if (state.selectedSortingOption ==
                                    LibraryPageState.sortingOptions.keys
                                        .elementAt(index))
                                  Row(
                                    children: [
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.check,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
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
              controller: _tabController,
              children: [
                buildTorrentsTab(state, context),
                WebDownloadsTab(state: state),
                UsenetTab(state: state),
              ],
            ),
            bottomNavigationBar: state.isSelecting
                ? BottomAppBar(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (state.selectedItems.any(
                          (item) => item is QueuedTorrent,
                        )) ...[
                          IconButton(
                            icon: Icon(Icons.play_arrow),
                            onPressed: () {
                              state.resumeSelectedItems();
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              state.deleteSelectedItems();
                            },
                          ),
                        ] else ...[
                          IconButton(
                            icon: Icon(Icons.pause),
                            onPressed: () {
                              state.pauseSelectedItems();
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.play_arrow),
                            onPressed: () {
                              state.resumeSelectedItems();
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () {
                              state.reannounceSelectedItems();
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              state.deleteSelectedItems();
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.download),
                            onPressed: () async {
                              if (Settings.getValue<String>(
                                    Constants.folderPath,
                                  ) ==
                                  null) {
                                bool granted = await showPermissionDialog(
                                  context,
                                );
                                if (granted) {
                                  // Proceed with download
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Permission not granted. Cannot proceed with download.',
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                // Proceed with download
                                state.downloadSelectedItems();
                              }
                            },
                          ),
                        ],
                      ],
                    ),
                  )
                : null,
            floatingActionButton: state.isSelecting
                ? const SizedBox.shrink()
                : AnimatedBuilder(
                    animation: _tabController.animation!,
                    builder: (context, child) {
                      // Calculate the current and next tab index
                      final animationValue = _tabController.animation!.value;
                      final currentIndex = _tabController.index;
                      final nextIndex = animationValue.round();
                      // Determine if we're transitioning and how far
                      final transitionProgress = (animationValue - currentIndex)
                          .abs();
                      // If transition is more than halfway, use next tab's icon
                      int iconTabIndex;
                      if (transitionProgress > 0.5) {
                        iconTabIndex = nextIndex;
                      } else {
                        iconTabIndex = currentIndex;
                      }
                      Icon getFabIcon() {
                        switch (iconTabIndex) {
                          case 0:
                            return const Icon(AntDesign.node_index_outline);
                          case 1:
                            return const Icon(Icons.cloud_download);
                          case 2:
                            return const Icon(Icons.hub);
                          default:
                            return const Icon(AntDesign.node_index_outline);
                        }
                      }

                      List<SpeedDialChild> getSpeedDialChildren() {
                        switch (iconTabIndex) {
                          case 1: // Web Downloads
                            return [
                              SpeedDialChild(
                                child: const Icon(Icons.cloud_download),
                                label: 'Web link',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddWebDownloadsTab(
                                        apiService: apiService,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ];
                          case 2: // Usenet
                            return [
                              SpeedDialChild(
                                child: const Icon(Icons.link),
                                label: 'Add NZB from URL',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddNzbLinkTab(),
                                    ),
                                  );
                                },
                              ),
                              SpeedDialChild(
                                child: const Icon(Icons.upload_file),
                                label: 'Add NZB from file',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddNzbFileTab(),
                                    ),
                                  );
                                },
                              ),
                              SpeedDialChild(
                                child: const Icon(Icons.search),
                                label: 'Search',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddUsenetSearchTab(),
                                    ),
                                  );
                                },
                              ),
                            ];
                          case 0:
                          default:
                            return [
                              SpeedDialChild(
                                child: const Icon(Icons.upload_file),
                                label: '.torrent file',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddTorrentFileTab(),
                                    ),
                                  );
                                },
                              ),
                              SpeedDialChild(
                                child: const Icon(BoxIcons.bx_magnet),
                                label: 'Magnet',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddMagnetTab(),
                                    ),
                                  );
                                },
                              ),
                              SpeedDialChild(
                                child: const Icon(Icons.search),
                                label: 'Search',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddSearchTorrentTab(),
                                    ),
                                  );
                                },
                              ),
                            ];
                        }
                      }

                      return SpeedDial(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        activeChild: const Icon(Icons.close),
                        direction: SpeedDialDirection.up,
                        children: getSpeedDialChildren(),
                        child: IconCraft(
                          const Icon(Icons.add),
                          getFabIcon(),
                          alignment: const Alignment(1.5, 1.5),
                        ),
                      );
                    },
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
        return ChangeNotifierProvider<LibraryPageState>.value(
          value: context.watch<LibraryPageState>(),
          builder: (context, _) {
            return Theme(
              data: Theme.of(context).copyWith(),
              child: StatefulBuilder(
                builder: (BuildContext _, StateSetter setState) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ListTile(title: Text('Main')),
                        _buildMainFilters(context, setState),
                        // const ListTile(title: Text("Qualities")),
                        // _buildQualityFilters(context, setState),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMainFilters(BuildContext context, StateSetter setState) {
    return Consumer<LibraryPageState>(
      builder: (context, state, child) {
        return Wrap(
          spacing: 8.0,
          children: LibraryPageState.filters.keys.map((filter) {
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
