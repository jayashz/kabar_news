import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/features/auth/repository/user_repository.dart';
import 'package:kabar_news/features/splash/cubit/startup_cubit.dart';
import 'package:kabar_news/features/splash/ui/widgets/splash_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StartupCubit(userRepo: context.read<UserRepository>()),
      child: const SplashWidget(),
    );
  }
}
