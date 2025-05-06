import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/features/trending/cubit/fetch_trending_cubit.dart';

import 'package:kabar_news/features/trending/ui/widgets/trending_widget.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FetchTrendingCubit>().fetchTrending();
    return const TrendingWidget();
  }
}
