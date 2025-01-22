import 'package:atba/services/api_service.dart';
import 'package:atba/screens/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:extended_sliver/extended_sliver.dart';
// import 'package:torbox/models/dynamicsliverappbar.dart';
// import 'package:intrinsic_size_builder/intrinsic_size_builder.dart'; // Add this import

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:android_intent_plus/android_intent.dart';

class DetailsPage extends StatefulWidget {
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
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic>? _metaData;
  bool _isLoading = true;
  bool _hasError = false;
  bool showButton = false;
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
    return Scaffold(
        appBar: widget.type == "movie"
            ? AppBar(
                title: Text(widget.title),
              )
            : null,
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _hasError
                ? const Center(child: Text('Failed to load data'))
                : widget.type == "movie"
                    ? buildMovieDetailBody()
                    : buildSeriesDetailBody());
  }

  Widget buildMovieDetailBody() {
    return buildMetaData();
  }

  Widget buildSeriesDetailBody() {
    // bodge solution - scrolling is really janky. but it will do for now.
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: buildMetaData(),
        ),
        if (_tabController != null)
          SliverToBoxAdapter(
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: _seasonData.keys.map((season) {
                return Tab(
                  text: season == 0 ? "Specials" : "Season $season",
                );
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
                      playEpisode(episode["id"], SearchType.tv);
                      print("Selected: ${episode["id"]}");
                    },
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          if (showButton)
            FilledButton.icon(
                onPressed: () {
                  playMovie(widget.id);
                },
                label: const Text('Play'),
                icon: const Icon(Icons.play_arrow)),
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
                const Text('Cast:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ..._metaData!['cast'].map<Widget>((actor) => Text(actor))
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
                const Text('Trailers:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ..._metaData!['trailers'].map<Widget>((trailer) => ListTile(
                      leading: const Icon(Icons.play_arrow),
                      title: const Text('Trailer'),
                      onTap: () {
                        // Open YouTube link
                        final url =
                            'https://www.youtube.com/watch?v=${trailer['source']}';
                        _launchURL(url);
                      },
                    )),
              ],
            ),
        ]),
      ),
    );
  }

  Widget networkImage(String url, BoxFit fit, {double? height, double? width}) {
    return Image.network(
      url,
      fit: fit,
      height: height,
      width: width,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
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
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    // TODO: Implement URL launcher for opening YouTube trailers
    // This method should be completed with a package like url_launcher
  }

  Future<void> playEpisode(String id, SearchType type) async {
    final torrentioApi = Provider.of<TorrentioAPI>(context, listen: false);
    print(torrentioApi.baseUrl);

    await torrentioApi.fetchStreamData(id, type);
    playURL(torrentioApi.url);
  }

  Future<void> playMovie(String id) async {
    final torrentioApi = Provider.of<TorrentioAPI>(context, listen: false);
    await torrentioApi.fetchStreamData(id, SearchType.movie);
    playURL(torrentioApi.url);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _launchIntent(String url) async {
    AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        type: "video/*",
        data: url,
      );
      intent.launch();
  
  }

  void playURL(String? url) {
    if (url == null) {
      _showError('Failed to load stream data');
      return;
    }
    Settings.getValue<bool>('key-use-internal-video-player') ?? false
        ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(url: url)),
          )
        : _launchIntent(url);
  }
}
