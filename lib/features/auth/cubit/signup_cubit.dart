import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/features/auth/repository/user_repository.dart';

class SignupCubit extends Cubit<CommonState> {
  SignupCubit({required this.userRepo}) : super(CommonIntialState());
  final UserRepository userRepo;
  signup({required String email, required String password}) async {
    emit(CommonLoadingState());
    final res = await userRepo.createAccount(email: email, password: password);
    res.fold((err) {
      emit(CommonErrorState(message: err));
    }, (data) {
      emit(CommonSuccessState(data: null));
    });
    emit(CommonSuccessState(data: null));
  }
}
