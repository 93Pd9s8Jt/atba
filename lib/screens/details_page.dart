import 'package:atba/services/stremio_addons/multi_addon_service.dart';
import 'package:atba/services/torbox_service.dart';
import 'package:atba/services/torrentio_config.dart';
import 'package:atba/services/video_playback_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:extended_sliver/extended_sliver.dart';
// import 'package:torbox/models/dynamicsliverappbar.dart';
// import 'package:intrinsic_size_builder/intrinsic_size_builder.dart'; // Add this import

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String type;
  final String id;

  const DetailsPage({
    required this.title,
    required this.type,
    required this.id,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final torboxService = context.read<TorboxAPI>();
    return ChangeNotifierProvider(
      create: (_) => MultiStremioAddonAPI(torboxService.apiKey),
      builder: (context, child) {
        return DetailsPageView(title: title, type: type, id: id);
      },
    );
  }
}

class DetailsPageView extends StatefulWidget {
  final String title;
  final String type;
  final String id;

  const DetailsPageView({
    required this.title,
    required this.type,
    required this.id,
    super.key,
  });

  @override
  _DetailsPageViewState createState() => _DetailsPageViewState();
}

class _DetailsPageViewState extends State<DetailsPageView>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic>? _metaData;
  bool _isLoading = true;
  bool _hasError = false;
  bool showButton = false;
  bool _isPlaying = false;
  final Map<String, Map<String, dynamic>> _selectedStreams = {};
  TabController? _tabController; // hmmm - won't be initialized for movies
  final GlobalKey _contentKey = GlobalKey();
  double _appBarHeight = 0;

  final Map<int, List<Map<String, dynamic>>> _seasonData = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _calculateHeight());
    showButton = widget.type == "movie";

    _fetchDetails();
  }

  void _calculateHeight() {
    final RenderClipRect? renderBox =
        _contentKey.currentContext?.findRenderObject() as RenderClipRect?;
    // print("RenderBox height: "+renderBox!.size.height.toString());
    if (renderBox != null && renderBox.size.height > 0) {
      setState(() {
        _appBarHeight = renderBox.size.height;
      });
    }
  }

  Future<void> _fetchDetails() async {
    final url =
        'https://v3-cinemeta.strem.io/meta/${widget.type}/${widget.id}.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print("Response: ${response.body}");
        setState(() {
          _metaData = json.decode(response.body)['meta'];
          if (_metaData == null) {
            _isLoading = false;
            _hasError = true;
            return;
          }
          if (!_metaData!.containsKey("videos")) {
            _isLoading = false;
            return;
          }
          for (var video in _metaData!["videos"]) {
            int season = video['season'];
            _seasonData.putIfAbsent(season, () => []).add(video);
          }
          _tabController = TabController(
            length: _seasonData.keys.length,
            vsync: this,
          );
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: widget.type == "movie"
              ? AppBar(title: Text(widget.title))
              : null,
          body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _hasError
              ? const Center(child: Text('Failed to load data'))
              : widget.type == "movie"
              ? buildMovieDetailBody()
              : buildSeriesDetailBody(),
        ),
        if (_isPlaying)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }

  Widget buildMovieDetailBody() {
    return buildMetaData();
  }

  Widget buildSeriesDetailBody() {
    // bodge solution - scrolling is really janky. but it will do for now.
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: buildMetaData()),
        if (_tabController != null)
          SliverToBoxAdapter(
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: _seasonData.keys.map((season) {
                return Tab(text: season == 0 ? "Specials" : "Season $season");
              }).toList(),
            ),
          ),
        SliverFillRemaining(
          child: TabBarView(
            controller: _tabController,
            children: _seasonData.keys.map((season) {
              final episodes = _seasonData[season] ?? [];
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: episodes.length,
                itemBuilder: (context, index) {
                  final episode = episodes[index];
                  return ListTile(
                    title: Text("E${episode["number"]}: ${episode["name"]}"),
                    subtitle: Text("${episode["overview"]}"),
                    onTap: () {
                      playEpisode(episode["id"]);
                      print("Selected: ${episode["id"]}");
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () => showQualitySelector(
                        context,
                        episode["id"],
                        SearchType.tv,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // Widget buildSeriesDetailBodyWithNestedScroll() {
  // return IntrinsicSizeBuilder(
  //   subject: NestedScrollView(
  //     headerSliverBuilder: (context, innerBoxIsScrolled) {
  //       return [
  //         SliverAppBar(
  //           expandedHeight: 700, // Adjust based on metadata content
  //           pinned: true,
  //           flexibleSpace: FlexibleSpaceBar(
  //             collapseMode: CollapseMode.pin,
  //             background: buildMetaData(),
  //           ),
  //           bottom: TabBar(
  //             controller: _tabController,
  //             isScrollable: true,
  //             tabs: _seasonData.keys.map((season) {
  //               return Tab(
  //                 text: season == 0 ? "Specials" : "Season $season",
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //       ];
  //     },
  //     body: TabBarView(
  //       controller: _tabController,
  //       children: _seasonData.keys.map((season) {
  //         final episodes = _seasonData[season] ?? [];
  //         return ListView.builder(
  //           padding: const EdgeInsets.all(8.0),
  //           itemCount: episodes.length,
  //           itemBuilder: (context, index) {
  //             final episode = episodes[index];
  //             return ListTile(
  //               title: Text("E${episode["number"]}: ${episode["name"]}"),
  //               subtitle: Text("${episode["overview"]}"),
  //               onTap: () {
  //                 playEpisode(episode["id"]);
  //                 print("Selected: ${episode["id"]}");
  //               },
  //             );
  //           },
  //         );
  //       }).toList(),
  //     ),
  //   ),
  //   builder: (context, nestedScrollViewSize, nestedScrollView) => Column(
  //     children: [
  //       SizedBox(
  //         height: nestedScrollViewSize.height,
  //         child: nestedScrollView,
  //       ),
  //     ],
  //   ),
  // );
  // }

  Widget buildMetaData() {
    return SingleChildScrollView(
      key: _contentKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_metaData?['background'] != null)
              networkImage(
                _metaData!['background'],
                BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            const SizedBox(height: 16),
            // if (_metaData?['poster'] != null)
            //   Center(
            //     child: Image.network(
            //       _metaData!['poster'],
            //       height: 200,
            //     ),
            //   ),
            if (showButton) // play button & video file change
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: () {
                      playMovie(widget.id);
                    },
                    label: const Text('Play'),
                    icon: const Icon(Icons.play_arrow),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () => showQualitySelector(
                      context,
                      widget.id,
                      SearchType.movie,
                    ),
                  ),
                ],
              ),

            // const SizedBox(height: 16),
            // video file change 3 dot menu (minor) icon
            const SizedBox(height: 16),
            if (_metaData?['description'] != null)
              Text(
                _metaData!['description'],
                style: const TextStyle(fontSize: 16),
              ),
            const SizedBox(height: 16),
            if (_metaData?['imdbRating'] != null)
              Text('IMDB Rating: ${_metaData!['imdbRating']}'),
            const SizedBox(height: 8),
            if (_metaData?['year'] != null) Text('Year: ${_metaData!['year']}'),
            const SizedBox(height: 8),
            if (_metaData?['runtime'] != null)
              Text('Runtime: ${_metaData!['runtime']}'),
            const SizedBox(height: 8),
            if (_metaData?['country'] != null)
              Text('Country: ${_metaData!['country']}'),
            const SizedBox(height: 8),
            if (_metaData?['awards'] != null)
              Text('Awards: ${_metaData!['awards']}'),
            const SizedBox(height: 16),
            if (_metaData?['cast'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cast:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ..._metaData!['cast'].map<Widget>((actor) => Text(actor)),
                ],
              ),
            const SizedBox(height: 16),
            if (_metaData?['director'] != null &&
                (_metaData!['director'] as List).isNotEmpty)
              Text('Director: ${(_metaData!['director'] as List).join(', ')}'),
            const SizedBox(height: 16),
            if (_metaData?['genre'] != null &&
                (_metaData!['genre'] as List).isNotEmpty)
              Text('Genres: ${(_metaData!['genre'] as List).join(', ')}'),
            const SizedBox(height: 16),
            if (_metaData?['trailers'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trailers:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ..._metaData!['trailers'].map<Widget>(
                    (trailer) => ListTile(
                      leading: const Icon(Icons.play_arrow),
                      title: const Text('Trailer'),
                      onTap: () {
                        // Open YouTube link
                        final url =
                            'https://www.youtube.com/watch?v=${trailer['source']}';
                        _launchURL(url);
                      },
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget networkImage(String url, BoxFit fit, {double? height, double? width}) {
    return Image.network(
      url,
      fit: fit,
      height: height,
      width: width,
      loadingBuilder:
          (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Center(
              child: Text(
                'Failed to load image.',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
    );
  }

  void showQualitySelector(BuildContext context, String id, SearchType type) {
    final addonApi = Provider.of<MultiStremioAddonAPI>(context, listen: false);
    addonApi.fetchStreamData(id, type);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ChangeNotifierProvider<MultiStremioAddonAPI>.value(
          value: addonApi,
          child: QualitySelector(
            id,
            type,
            onStreamSelected: (stream) {
              setState(() {
                _selectedStreams[id] = stream;
              });
            },
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    await launchUrl(Uri.parse(url));
  }

  Future<void> playStream(String id, SearchType type) async {
    setState(() {
      _isPlaying = true;
    });

    final addonApi = Provider.of<MultiStremioAddonAPI>(context, listen: false);

    if (_selectedStreams[id] == null) {
      await addonApi.fetchStreamData(id, type);
      if (addonApi.selectedStreams[id] == null) {
        setState(() {
          _isPlaying = false;
        });
        _showError("No streams found.");
        return;
      }
      _selectedStreams[id] = addonApi.selectedStreams[id]!;
    }

    playURL(_selectedStreams[id]?['url']);

    setState(() {
      _isPlaying = false;
    });
  }

  Future<void> playEpisode(String id) async {
    playStream(id, SearchType.tv);
  }

  Future<void> playMovie(String id) async {
    playStream(id, SearchType.movie);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void playURL(String? url) {
    VideoPlaybackService.playURL(context, url);
  }
}

class QualitySelector extends StatefulWidget {
  final Function(Map<String, dynamic>) onStreamSelected;
  final String id;
  final SearchType type;

  const QualitySelector(
    this.id,
    this.type, {
    required this.onStreamSelected,
    super.key,
  });

  @override
  _QualitySelectorState createState() => _QualitySelectorState();
}

class _QualitySelectorState extends State<QualitySelector> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    final addonProvider = context.watch<MultiStremioAddonAPI>();

    if (addonProvider.isLoading && addonProvider.streams.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else if (false) {
      return Center(child: Text('Error: '));
    } else if (!addonProvider.isLoading && addonProvider.streams.isEmpty) {
      return Center(child: const Text("No streams found."));
    } else {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Choose video quality:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: StreamList(addonProvider: addonProvider, widget: widget),
            ),
            if (addonProvider.isLoading)
              Center(child: CircularProgressIndicator()),
          ],
        ),
      );
    }
  }
}

class StreamList extends StatelessWidget {
  const StreamList({
    super.key,
    required this.addonProvider,
    required this.widget,
  });

  final MultiStremioAddonAPI addonProvider;
  final QualitySelector widget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addonProvider.streams.length,
      itemBuilder: (context, index) {
        final stream = addonProvider.streams[index];
        return ListTile(
          title: Text(
            "${stream["name"]}\n${stream['title'] ?? stream["description"]}",
          ),
          onTap: () {
            addonProvider.setStream(widget.id, stream);
            widget.onStreamSelected(stream);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
