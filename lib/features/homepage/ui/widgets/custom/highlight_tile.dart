import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/router/route_path.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

class HighlightTile extends StatelessWidget {
  final News news;
  const HighlightTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RoutePath.details, extra: news);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 160,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: news.urlToImage != null
                    ? NetworkImage(
                        news.urlToImage!,
                      )
                    : AssetImage(Assets.noImage),
                fit: BoxFit.cover,
                alignment: Alignment.center),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.5,
            padding: EdgeInsets.all(14),
            child: Text(
              news.title!,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
