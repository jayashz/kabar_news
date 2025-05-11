import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

import 'package:kabar_news/features/homepage/repository/news_repository.dart';

class SearchNewCubit extends Cubit<CommonState> {
  SearchNewCubit() : super(CommonIntialState());
  final NewsRepository newsRepository = NewsRepository();

  fetchSearchNew(String query) async {
    emit(CommonLoadingState());
    final res = await newsRepository.fetchSearch(query);
    res.fold((err) {
      emit(CommonErrorState(message: err));
    }, (data) {
      emit(CommonSuccessState<List<News>>(data: data));
    });
  }
}
