import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/features/auth/repository/user_repository.dart';
import 'package:kabar_news/features/splash/model/startup_data.dart';

class StartupCubit extends Cubit<CommonState> {
  StartupCubit({required this.userRepo}) : super(CommonIntialState());
  final UserRepository userRepo;
  init() async {
    emit(CommonLoadingState());
    await Future.delayed(Duration(seconds: 2));
    await userRepo.init();
    final isLoggedIn = userRepo.token.isNotEmpty;

    final param = StartupData(isLoggedIn: isLoggedIn);
    emit(CommonSuccessState(data: param));
  }
}
