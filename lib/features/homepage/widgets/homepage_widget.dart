import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/common/router/route_path.dart';
import 'package:kabar_news/features/homepage/widgets/custom/trending_cards.dart';
import 'package:kabar_news/common/custom_widgets/custom_searchfield.dart';
import 'package:kabar_news/features/homepage/cubit/fetch_news_cubit.dart';
import 'package:kabar_news/features/homepage/model/news.dart';
import 'package:kabar_news/features/homepage/widgets/custom/custom_listtile.dart';

class HomepageWidget extends StatelessWidget {
  const HomepageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FetchNewsCubit>().fetchNews();
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
          BlocBuilder<FetchNewsCubit, CommonState>(
            builder: (context, state) {
              if (state is CommonSuccessState<List<News>>) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        CustomSearchfield(onSubmitted: (query) {
                          context.push(RoutePath.search, extra: query);
                        }),
                        // Add your other widgets here
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Trending"),
                            TextButton(
                                onPressed: () {
                                  context.push(RoutePath.trending);
                                },
                                child: Text("See all")),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TrendingCards(
                          news: state.data[0],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Latest",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextButton(
                              onPressed: () {
                                context.push(RoutePath.trending);
                              },
                              child: Text(
                                "See all",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return CustomListtile(
                              news: state.data[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state is CommonLoadingState) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is CommonErrorState) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
