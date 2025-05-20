import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/common/custom_widgets/custom_searchfield.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

import 'package:kabar_news/features/homepage/ui/widgets/custom/custom_tile.dart';
import 'package:kabar_news/features/search/cubit/search_new_cubit.dart';

class SearchWidget extends StatelessWidget {
  final String query;
  const SearchWidget({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CustomSearchfield(
                onSubmitted: (query) {
                  context.read<SearchNewCubit>().fetchSearchNew(query);
                },
              ),
              Expanded(
                child: BlocBuilder<SearchNewCubit, CommonState>(
                  builder: (context, state) {
                    if (state is CommonLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CommonErrorState) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is CommonSuccessState<List<News>>) {
                      return ListView.builder(
                        itemCount: state.data.length,
                        padding: EdgeInsets.only(top: 10),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomTile(news: state.data[index]),
                          );
                        },
                      );
                    }
                    return const Center(child: Text('No data available'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
