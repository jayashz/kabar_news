import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/features/homepage/repository/news_repository.dart';

class FetchNews extends Cubit<CommonState> {
  final NewsRepository newsRepository;
  FetchNews({required this.newsRepository}) : super(CommonIntialState());

  fetchNews() async {
    emit(CommonLoadingState());
    print("Fetching news...");
    final res = await newsRepository.fetchNews();
    print(res);
  }
}
