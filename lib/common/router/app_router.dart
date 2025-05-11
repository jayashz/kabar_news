import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/features/bookmark/ui/pages/bookmark_page.dart';
import 'package:kabar_news/features/dashboard/widgets/dashboard.dart';
import 'package:kabar_news/features/details/ui/pages/details_page.dart';
import 'package:kabar_news/features/explore/pages/explore_page.dart';
import 'package:kabar_news/features/homepage/cubit/fetch_news_cubit.dart';
import 'package:kabar_news/features/homepage/model/news.dart';
import 'package:kabar_news/features/homepage/pages/homepage.dart';
import 'package:kabar_news/features/homepage/repository/news_repository.dart';
import 'package:kabar_news/features/profile/ui/pages/profile_page.dart';
import 'package:kabar_news/features/search/cubit/search_new_cubit.dart';
import 'package:kabar_news/features/search/ui/pages/search_page.dart';
import 'package:kabar_news/features/splash/ui/pages/splash_page.dart';
import 'package:kabar_news/features/trending/cubit/fetch_trending_cubit.dart';
import 'package:kabar_news/features/trending/ui/pages/trending_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: GlobalKey<NavigatorState>(),
  routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Dashboard(
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: "/home",
            builder: (context, state) => BlocProvider(
              create: (context) => FetchNewsCubit(
                  newsRepository: context.read<NewsRepository>()),
              child: const Homepage(),
            ),
          ),
          GoRoute(
            path: "/explore",
            builder: (context, state) => const ExplorePage(),
          ),
          GoRoute(
            path: "/bookmark",
            builder: (context, state) => const BookmarkPage(),
          ),
          GoRoute(
            path: "/profile",
            builder: (context, state) => const ProfilePage(),
          ),
        ]),
    GoRoute(
      path: "/details",
      builder: (context, state) {
        final News news = state.extra as News;
        return DetailsPage(news: news);
      },
    ),
    GoRoute(
      path: "/trending",
      builder: (context, state) {
        return BlocProvider(
          create: (context) => FetchTrendingCubit(),
          child: TrendingPage(),
        );
      },
    ),
    GoRoute(
      path: "/search",
      builder: (context, state) {
        final query = state.extra as String;
        return BlocProvider(
          create: (context) => SearchNewCubit(),
          child: SearchPage(
            query: query,
          ),
        );
      },
    )
  ],
);
