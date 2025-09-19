import 'package:flutter/material.dart';

class DownloadsSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const DownloadsSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => controller.clear(),
          ),
        ),
      ),
    );
  }
}
