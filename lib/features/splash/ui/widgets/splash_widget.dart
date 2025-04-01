import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/features/homepage/pages/homepage.dart';
import 'package:kabar_news/features/splash/cubit/startup_cubit.dart';
import 'package:kabar_news/features/splash/model/startup_data.dart';
import 'package:page_transition/page_transition.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BlocListener<StartupCubit, CommonState>(
        listener: (context, state) {
            if(state is CommonSuccessState<StartupData>){
              if(state.data.isLoggedIn){
                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child:Homepage() ))
              }
            }
        },
        child: Center(
          child: Center(
            child: Text("Heres the center widget"),
          ),
        ),
      ),
    );
  }
}
