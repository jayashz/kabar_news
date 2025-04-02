import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/features/auth/repository/user_repository.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              context
                  .read<UserRepository>()
                  .signIn(email: "jayash3@gmail.com", password: "password");
            },
            child: Text("Login")),
      ),
    );
  }
}
