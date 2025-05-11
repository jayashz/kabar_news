import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/common/custom_widgets/skeletons/tile_skeleton.dart';
import 'package:kabar_news/features/explore/cubit/fetch_news_topic_cubit.dart';
import 'package:kabar_news/features/homepage/model/news.dart';
import 'package:kabar_news/features/homepage/ui/widgets/custom/custom_tile.dart';
import 'package:kabar_news/features/homepage/ui/widgets/custom/highlight_tile.dart';


class ExploreTopicWidget extends StatefulWidget {
  final String query;
  const ExploreTopicWidget({super.key, required this.query});

  @override
  State<ExploreTopicWidget> createState() => _ExploreTopicWidgetState();
}

class _ExploreTopicWidgetState extends State<ExploreTopicWidget> {
  List<int> randomIndex = [];
  int temp = 0;
  @override
  void initState() {
    for (var i = 0; i < 10; i++) {
      temp = temp + 5 + Random().nextInt(6);
      randomIndex.add(temp);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<FetchNewsTopicCubit>().fetchNewsTopic(widget.query);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              widget.query,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            centerTitle: true,
          ),
          BlocBuilder<FetchNewsTopicCubit, CommonState>(
            builder: (context, state) {
              if (state is CommonLoadingState) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CustomTileSkeleton(),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTileSkeleton(),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTileSkeleton(),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTileSkeleton(),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTileSkeleton(),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTileSkeleton(),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTileSkeleton(),
                      ],
                    ),
                  ),
                );
              } else if (state is CommonErrorState) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              }
              if (state is CommonSuccessState<List<News>>) {
                final validNews = state.data
                    .where((i) =>
                        i.author != null &&
                        i.title != null &&
                        i.content != null &&
                        i.description != null &&
                        i.urlToImage != null)
                    .toList();
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: validNews.length, (context, index) {
                    if (randomIndex.contains(index)) {
                      return HighlightTile(news: validNews[index]);
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTile(
                        news: validNews[index],
                      ),
                    );
                  }),
                );
              }
              return SizedBox();
            },
          )
        ],
      ),
    );
  }
}
