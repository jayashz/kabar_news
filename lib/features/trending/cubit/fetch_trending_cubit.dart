import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/features/homepage/model/news.dart';
import 'package:kabar_news/features/homepage/repository/news_repository.dart';

class FetchTrendingCubit extends Cubit<CommonState> {
  final NewsRepository newsRepository = NewsRepository();
  FetchTrendingCubit() : super(CommonIntialState());

  fetchTrending() async {
    emit(CommonLoadingState());
    final res = await newsRepository.fetchTrending();
    res.fold((err) {
      emit(CommonErrorState(message: err));
    }, (data) {
      emit(CommonSuccessState<List<News>>(data: data));
    });

  }
}
