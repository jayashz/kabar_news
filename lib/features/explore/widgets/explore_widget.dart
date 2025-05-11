import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/custom_widgets/custom_searchfield.dart';
import 'package:kabar_news/common/router/route_path.dart';
import 'package:kabar_news/features/explore/widgets/cards/topic_card.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 34),
            ),
            centerTitle: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: CustomSearchfield(onSubmitted: (query) {
                context.push(RoutePath.search, extra: query);
              }),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Topic"),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text("See all"),
                      )
                    ],
                  ),
                  TopicCard(
                    title: "Business",
                    asset: Assets.business,
                    description:
                        "Top news relating to business and economy around the world",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TopicCard(
                    asset: Assets.science,
                    title: "Science",
                    description: "News regarding scientific break throughs",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TopicCard(
                    asset: Assets.sports,
                    title: "Sports",
                    description: "Sports all around the world",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
