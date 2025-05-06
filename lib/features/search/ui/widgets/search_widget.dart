import 'package:flutter/material.dart';
import 'package:kabar_news/common/custom_widgets/custom_searchfield.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CustomSearchfield(onSubmitted: (query) {}),
            ],
          ),
        ),
      ),
    );
  }
}
