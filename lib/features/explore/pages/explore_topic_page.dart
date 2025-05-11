import 'package:flutter/material.dart';
import 'package:kabar_news/features/explore/widgets/explore_topic_widget.dart';

class ExploreTopicPage extends StatelessWidget {
  final String query;
  const ExploreTopicPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return ExploreTopicWidget(
      query: query,
    );
  }
}
