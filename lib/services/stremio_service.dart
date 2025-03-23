import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

enum SearchType { movie, tv }

extension SearchTypeExtension on SearchType {
  String get name {
    switch (this) {
      case SearchType.movie:
        return 'movie';
      case SearchType.tv:
        return 'series';
    }
  }
}

class StremioRequests with ChangeNotifier {
  Map<String, List<Map<String, dynamic>>> searchResults = {
    "movie": [],
    "series": []
  };
  bool isLoading = false;
  bool hasSearched = false;

  StremioRequests();

  Future<void> fetchSearchResults(String query) async {
    isLoading = true;
    hasSearched = true;
    searchResults = {"movie": [], "series": []}; // Clear previous results
    notifyListeners();

    try {
      final responses = await Future.wait([
        http.get(
          Uri.parse(
            "https://v3-cinemeta.strem.io/catalog/${SearchType.movie.name}/top/search=${Uri.encodeComponent(query)}.json",
          ),
        ),
        http.get(
          Uri.parse(
            "https://v3-cinemeta.strem.io/catalog/${SearchType.tv.name}/top/search=${Uri.encodeComponent(query)}.json",
          ),
        )
      ]);

      final http.Response movieResponse = responses[0];
      final http.Response seriesResponse = responses[1];

      final movieData = jsonDecode(movieResponse.body);
      final seriesData = jsonDecode(seriesResponse.body);
      searchResults = {
        "movie": List<Map<String, dynamic>>.from(movieData['metas'] ?? []),
        "series": List<Map<String, dynamic>>.from(seriesData['metas'] ?? [])
      };
    } catch (e) {
      print("Error fetching search results: $e");
      searchResults = {"movie": [], "series": []}; // Clear results on error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
