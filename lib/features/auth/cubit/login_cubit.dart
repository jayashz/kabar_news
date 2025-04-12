import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/features/auth/repository/user_repository.dart';

class LoginCubit extends Cubit<CommonState> {
  LoginCubit({required this.userRepo}) : super(CommonIntialState());
  final UserRepository userRepo;

  login({required String email, required String password}) async {
    emit(CommonLoadingState());
    final res = await userRepo.signIn(email: email, password: password);

  }
}
