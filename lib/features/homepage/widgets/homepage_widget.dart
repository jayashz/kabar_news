import 'package:flutter/material.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/custom_widgets/custom_searchfield.dart';

class HomepageWidget extends StatelessWidget {
  const HomepageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          Assets.logo,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CustomSearchfield(),
          ],
        ),
      ),
    );
  }
}
