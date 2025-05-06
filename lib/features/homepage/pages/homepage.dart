import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/features/homepage/cubit/fetch_news_cubit.dart';
import 'package:kabar_news/features/homepage/repository/news_repository.dart';
import 'package:kabar_news/features/homepage/widgets/homepage_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomepageWidget();
  }
}
