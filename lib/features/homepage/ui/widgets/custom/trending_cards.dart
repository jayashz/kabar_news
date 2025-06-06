import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/router/route_path.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

class TrendingCards extends StatelessWidget {
  final News news;

  const TrendingCards({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(RoutePath.details, extra: news),
      child: Container(
        constraints: BoxConstraints(minHeight: 200),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: news.urlToImage != null
                  ? Image.network(
                      news.urlToImage!,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          Assets.noImage,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    )
                  : Image.asset(Assets.noImage),
            ),
            const SizedBox(height: 8),
            Text(
              news.author!,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              news.title!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.fiber_new_sharp,
                  color: Colors.red,
                ),
                Text(
                  news.source.name,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Icon(
                  Icons.timelapse_rounded,
                  size: 17,
                ),
                Text(
                  DateFormat('yMMMd').format(news.publishedAt),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
