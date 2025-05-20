import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/features/search/cubit/search_new_cubit.dart';
import 'package:kabar_news/features/search/ui/widgets/search_widget.dart';

class SearchPage extends StatelessWidget {
  final String query;
  const SearchPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchNewCubit()..fetchSearchNew(query),
      child: SearchWidget(
        query: query,
      ),
    );
  }
}
