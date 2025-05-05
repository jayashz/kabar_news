import 'package:flutter/material.dart';

import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/custom_widgets/cards/trending_cards.dart';
import 'package:kabar_news/common/custom_widgets/custom_searchfield.dart';

class HomepageWidget extends StatelessWidget {
  const HomepageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Image.asset(
              Assets.logo,
              height: 30,
            ),
            centerTitle: false,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Handle notification button press
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const CustomSearchfield(),
                  // Add your other widgets here
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trending"),
                      TextButton(onPressed: () {}, child: Text("See all")),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TrendingCards(
                    title: "Russian warship: Moskva sinks in Black Sea",
                    photoUrl: Assets.boat,
                    country: "Europe",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
