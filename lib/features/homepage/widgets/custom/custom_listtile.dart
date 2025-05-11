import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/router/route_path.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

class CustomListtile extends StatelessWidget {
  final News news;
  const CustomListtile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(RoutePath.details, extra: news),
      splashColor: Colors.grey.shade400,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey,
                width: 100,
                height: 100,
                child: news.urlToImage != null
                    ? Image.network(
                        news.urlToImage!,
                        fit: BoxFit.cover,
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
                    : Image.asset(
                        Assets.noImage,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    news.title!,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    "-${news.source.name}",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
