import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/features/auth/ui/screens/login_page.dart';
import 'package:kabar_news/features/splash/cubit/startup_cubit.dart';
import 'package:kabar_news/features/splash/model/startup_data.dart';
import 'package:page_transition/page_transition.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<StartupCubit, CommonState>(
        listener: (context, state) {
          if (state is CommonSuccessState<StartupData>) {
            if (state.data.isLoggedIn == false) {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: LoginPage(),
                ),
              );
            } else {
              context.go('/home');
            }
          }
        },
        child: Center(
          child: Center(
            child: Image.asset(Assets.logo),
          ),
        ),
      ),
    );
  }
}
