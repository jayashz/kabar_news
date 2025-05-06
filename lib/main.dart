import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kabar_news/common/custom_themes.dart';
import 'package:kabar_news/common/router/app_router.dart';
import 'package:kabar_news/features/homepage/repository/news_repository.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/features/auth/repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: "keys.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserRepository()),
        RepositoryProvider(
          create: (context) => NewsRepository(),
        ),
      ],
      child: MaterialApp.router(
        theme: CustomThemes.lightTheme,
        darkTheme: CustomThemes.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
    );
  }
}
