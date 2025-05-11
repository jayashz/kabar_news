import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearchfield extends StatelessWidget {
  void Function(String) onSubmitted;
  CustomSearchfield({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) => onSubmitted(value),
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
