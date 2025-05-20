import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/common/custom_widgets/skeletons/tile_skeleton.dart';
import 'package:kabar_news/common/router/route_path.dart';
import 'package:kabar_news/features/homepage/cubit/fetch_news_cubit.dart';
import 'package:kabar_news/features/homepage/model/news.dart';
import 'package:kabar_news/features/homepage/ui/widgets/custom/custom_tile.dart';
import 'package:kabar_news/features/homepage/ui/widgets/custom/highlight_tile.dart';

class HomeContent extends StatefulWidget {
  final String query;
  const HomeContent({super.key, required this.query});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with AutomaticKeepAliveClientMixin {
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
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () async {
        context.read<FetchNewsCubit>().fetchNews(widget.query);
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<FetchNewsCubit, CommonState>(
              builder: (context, state) {
                if (state is CommonLoadingState) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  );
                } else if (state is CommonErrorState) {
                  return Center(
                    child: Text(state.message),
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
                  return Column(
                    children: [
                      CarouselSlider(
                        items: validNews.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return InkWell(
                                onTap: () {
                                  context.push(RoutePath.details, extra: i);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: i.urlToImage != null
                                            ? NetworkImage(
                                                i.urlToImage!,
                                              )
                                            : AssetImage(Assets.noImage),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    padding: EdgeInsets.all(14),
                                    child: Text(
                                      i.title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 250,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 6),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox();
              },
            ),
          ),
          BlocBuilder<FetchNewsCubit, CommonState>(
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
