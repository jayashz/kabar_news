import 'package:flutter/material.dart';

class CustomSearchfield extends StatelessWidget {
  const CustomSearchfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Handle clear button press
          },
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
