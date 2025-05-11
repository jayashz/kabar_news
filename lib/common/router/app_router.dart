import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/features/auth/ui/screens/login_page.dart';
import 'package:kabar_news/features/auth/ui/screens/signup_page.dart';
import 'package:kabar_news/features/auth/ui/screens/success_page.dart';
import 'package:kabar_news/features/bookmark/ui/pages/bookmark_page.dart';
import 'package:kabar_news/features/dashboard/widgets/dashboard.dart';
import 'package:kabar_news/features/details/ui/pages/details_page.dart';
import 'package:kabar_news/features/explore/cubit/fetch_news_topic_cubit.dart';
import 'package:kabar_news/features/explore/pages/explore_page.dart';
import 'package:kabar_news/features/explore/pages/explore_topic_page.dart';
import 'package:kabar_news/features/homepage/model/news.dart';
import 'package:kabar_news/features/homepage/ui/pages/homepage.dart';
import 'package:kabar_news/features/homepage/repository/news_repository.dart';
import 'package:kabar_news/features/profile/ui/pages/profile_page.dart';
import 'package:kabar_news/features/search/ui/pages/search_page.dart';
import 'package:kabar_news/features/settings/ui/pages/settings_pages.dart';
import 'package:kabar_news/features/splash/ui/pages/splash_page.dart';

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
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return Builder(
          builder: (context) => LoginPage(),
        );
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return Builder(
          builder: (context) => SignupPage(),
        );
      },
    ),
    GoRoute(
      path: '/success',
      builder: (BuildContext context, GoRouterState state) {
        return const SuccessPage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => Dashboard(body: child),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) {
                return const Homepage();
              }),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/explore',
              builder: (BuildContext context, GoRouterState state) {
                return const ExplorePage();
              }),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/bookmark',
              builder: (BuildContext context, GoRouterState state) {
                return const BookmarkPage();
              }),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/profile',
              builder: (BuildContext context, GoRouterState state) {
                return const ProfilePage();
              }),
        ]),
      ],
    ),
    GoRoute(
        path: '/details',
        builder: (BuildContext context, GoRouterState state) {
          final News news = state.extra as News;
          return DetailsPage(
            news: news,
          );
        }),
    GoRoute(
        path: '/exploreTopic',
        builder: (BuildContext context, GoRouterState state) {
          final String query = state.extra as String;
          return BlocProvider(
            create: (context) => FetchNewsTopicCubit(
                newsRepository: context.read<NewsRepository>()),
            child: ExploreTopicPage(
              query: query,
            ),
          );
        }),
    GoRoute(
        path: '/settings',
        builder: (BuildContext context, GoRouterState state) {
          return const SettingsPages();
        }),
    GoRoute(
      path: "/search",
      builder: (context, state) {
        final query = state.extra as String;
        return SearchPage(
          query: query,
        );
      },
    ),
  ],
);
