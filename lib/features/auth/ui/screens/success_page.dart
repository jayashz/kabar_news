import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/router/route_path.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Content
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                          Theme.of(context).brightness == Brightness.light
                              ? Assets.logo
                              : Assets.logo),
                      const SizedBox(height: 20),
                      Text(
                        "Congratulations!",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 32),
                      ),
                      const SizedBox(height: 10),
                      const Text("Your account is ready to use"),
                    ],
                  ),
                ),
              ),
              // Bottom Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go(RoutePath.home);
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text("Go to Dashboard"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
