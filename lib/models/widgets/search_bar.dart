import 'package:atba/services/library_page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DownloadsSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;

  const DownloadsSearchBar({
    super.key,
    required this.controller,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LibraryPageState>(context);
    return SliverAppBar(
      floating: true,
      title: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => {
              if (controller.text.isNotEmpty)
                controller.clear()
              else
                state.toggleSearch(),
            },
          ),
        ),
      ),
    );
  }
}
