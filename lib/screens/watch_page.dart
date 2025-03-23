import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atba/services/api_service.dart';
import 'package:atba/screens/details_page.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  _WatchPageState createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> with SingleTickerProviderStateMixin {
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

                    if (api.searchResults["movie"]!.isEmpty && api.searchResults["series"]!.isEmpty && api.hasSearched) {
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


                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: api.searchResults[searchType]!.length,
                      itemBuilder: (context, index) {
                        final item = api.searchResults[searchType]![index];
                        return MovieCard(
                          title: item['name'] ?? "",
                          description: item['description'] ?? "No description available",
                          posterUrl: item['poster'] ?? "",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(title: item["name"], type: searchType, id: item["id"]),
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
  final String description;
  final String posterUrl;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster Image
            if (posterUrl.isNotEmpty)
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.network(
                  posterUrl,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              )
            else
              Container(
                width: 100,
                height: 150,
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported, color: Colors.white70),
              ),
            // Title and Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      heightFactor: 0.2,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // const SizedBox(height: 8),
                    // Text(
                    //   description,
                    //   style: const TextStyle(fontSize: 14, color: Colors.black54),
                    //   maxLines: 3,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
