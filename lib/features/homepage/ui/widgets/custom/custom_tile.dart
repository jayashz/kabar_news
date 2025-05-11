import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/router/route_path.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

class CustomTile extends StatelessWidget {
  final News news;
  const CustomTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    if (news.author == null ||
        news.title == null ||
        news.content == null ||
        news.description == null ||
        news.urlToImage == null) {
      return SizedBox();
    }
    return InkWell(
      onTap: () {
        context.push(RoutePath.details, extra: news);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: SizedBox(
              height: 100,
              width: 120,
              child: news.urlToImage != null
                  ? Image.network(
                      news.urlToImage!,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          Assets.noImage,
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
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                news.description!,
                maxLines: 3,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
