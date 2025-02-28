import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atba/services/stremio_service.dart';
import 'package:atba/screens/details_page.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  _WatchPageState createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabTypes = const [
    Tab(text: 'Movies'),
    Tab(text: 'Series'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabTypes.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final stremioApi = Provider.of<StremioRequests>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabTypes,
        ),
      ),
      body: Column(
        children: [
          SearchBar(
            onSearch: (query) {
              stremioApi.fetchSearchResults(query);
            },
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _tabTypes.map((Tab tab) {
                return Consumer<StremioRequests>(
                  builder: (context, api, child) {
                    if (api.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (api.searchResults["movie"]!.isEmpty &&
                        api.searchResults["series"]!.isEmpty &&
                        api.hasSearched) {
                      return const Center(child: Text("No results found"));
                    }

                    if (!api.hasSearched) {
                      return const Center(child: Text("Press enter to search"));
                    }
                    final String searchType;
                    switch (tab.text!.toLowerCase()) {
                      case "movies":
                        searchType = "movie";
                        break;
                      case "series":
                        searchType = "series";
                        break;
                      default:
                        searchType = "movie";
                        break;
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width > 600 ? 3 : 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 0,
                      ),
                      itemCount: api.searchResults[searchType]!.length,
                      itemBuilder: (context, index) {
                        final item = api.searchResults[searchType]![index];
                        return MovieCard(
                          title: item['name'] ?? "",
                          posterUrl: item['poster'] ?? "",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                    title: item["name"],
                                    type: searchType,
                                    id: item["id"]),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const SearchBar({super.key, required this.onSearch});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: const Icon(Icons.search),
        ),
        onSubmitted: (query) {
          if (query.isNotEmpty) {
            widget.onSearch(query);
          }
        },
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String posterUrl;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.title,
    required this.posterUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster Image
            if (posterUrl.isNotEmpty)
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                child: Image.network(
                  posterUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
              )
            else
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported,
                    color: Colors.white70),
              ),
            // Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
