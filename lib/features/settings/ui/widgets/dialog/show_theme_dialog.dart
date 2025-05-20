import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/theme/theme_cubit.dart';

void showThemeDialog(BuildContext context) {
  final cubit = context.read<ThemeCubit>();
  final current = cubit.state;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Choose Theme"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<ThemeMode>(
              title: const Text("System Default"),
              value: ThemeMode.system,
              groupValue: current,
              onChanged: (val) {
                cubit.setTheme(val!);
                Navigator.pop(context);
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text("Light"),
              value: ThemeMode.light,
              groupValue: current,
              onChanged: (val) {
                cubit.setTheme(val!);
                Navigator.pop(context);
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text("Dark"),
              value: ThemeMode.dark,
              groupValue: current,
              onChanged: (val) {
                cubit.setTheme(val!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
