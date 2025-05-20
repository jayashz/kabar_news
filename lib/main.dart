import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kabar_news/common/theme/custom_themes.dart';
import 'package:kabar_news/common/router/app_router.dart';
import 'package:kabar_news/common/theme/theme_cubit.dart';
import 'package:kabar_news/features/bookmark/repository/bookmark_repository.dart';
import 'package:kabar_news/features/homepage/repository/news_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: "keys.env");
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => NewsRepository(),
          ),
          RepositoryProvider(
            create: (context) => BookmarkRepository(),
          )
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: CustomThemes.lightTheme,
              darkTheme: CustomThemes.darkTheme,
              themeMode: themeMode,
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}
