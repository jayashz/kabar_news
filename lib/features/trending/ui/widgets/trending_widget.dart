import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/features/homepage/model/news.dart';
import 'package:kabar_news/features/homepage/widgets/custom/trending_cards.dart';
import 'package:kabar_news/features/trending/cubit/fetch_trending_cubit.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Trending'),
      ),
      body: SafeArea(child: BlocBuilder<FetchTrendingCubit, CommonState>(
        builder: (context, state) {
          print(state is CommonSuccessState<List<News>>);
          if (state is CommonLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CommonErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is CommonSuccessState<List<News>>) {
            return ListView.builder(
              shrinkWrap: false,
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final news = state.data[index];
                return TrendingCards(news: news);
              },
            );
          }
          return const Center(child: Text('No data available'));
        },
      )),
    );
  }
}
