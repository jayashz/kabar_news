import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/router/route_path.dart';
import 'package:kabar_news/features/splash/ui/widgets/splash_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool navigated = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Image.asset(Assets.logo),
            );
          }
          if (!navigated) {
            navigated = true;
            Future.microtask(() async {
              await Future.delayed(const Duration(seconds: 2));
              if (context.mounted && snapshot.hasData) {
                context.go(RoutePath.home);
              } else {
                if (context.mounted) {
                  context.go(RoutePath.login);
                }
              }
            });
          }

          return const SplashWidget();
        });
  }
}
