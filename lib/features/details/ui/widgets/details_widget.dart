import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

class DetailsWidget extends StatelessWidget {
  final News news;
  const DetailsWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    news.source.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    DateFormat('yMMMd').format(news.publishedAt),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 250,
              child: news.urlToImage != null
                  ? Image.network(
                      news.urlToImage!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      Assets.noImage,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                news.author!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                news.title!,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 24,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                news.description!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                news.content!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
