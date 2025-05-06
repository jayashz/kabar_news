import 'package:flutter/widgets.dart';
import 'package:kabar_news/features/details/ui/widgets/details_widget.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

class DetailsPage extends StatelessWidget {
  final News news;
  const DetailsPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return DetailsWidget(news: news);
  }
}
