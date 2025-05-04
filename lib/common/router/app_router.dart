import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/features/bookmark/ui/pages/bookmark_page.dart';
import 'package:kabar_news/features/dashboard/widgets/dashboard.dart';
import 'package:kabar_news/features/explore/pages/explore_page.dart';
import 'package:kabar_news/features/homepage/pages/homepage.dart';
import 'package:kabar_news/features/profile/ui/pages/profile_page.dart';
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
    ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Dashboard(
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: "/home",
            builder: (context, state) => const Homepage(),
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
        ])
  ],
);
