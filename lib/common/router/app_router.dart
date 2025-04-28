import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/features/homepage/pages/homepage.dart';
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
          return Scaffold(
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: "/home",
            builder: (context, state) => const Homepage(),
          ),
        ])
  ],
);
