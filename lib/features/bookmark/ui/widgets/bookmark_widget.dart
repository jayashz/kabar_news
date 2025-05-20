import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kabar_news/features/bookmark/repository/bookmark_repository.dart';
import 'package:kabar_news/features/homepage/ui/widgets/custom/custom_tile.dart';

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BookmarkRepository newsRepo = BookmarkRepository();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Bookmark",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 34),
            ),
            centerTitle: false,
          ),
          StreamBuilder(
            stream: newsRepo.streamBookmarks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - kToolbarHeight,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                Fluttertoast.showToast(msg: snapshot.error.toString());
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - kToolbarHeight,
                    child: Center(
                      child: Text('Something went wrong'),
                    ),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - kToolbarHeight,
                    child: Center(
                      child: Text('No bookmarks yet'),
                    ),
                  ),
                );
              }

              final bookmarks = snapshot.data!;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final news = bookmarks[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      child: CustomTile(news: news),
                    );
                  },
                  childCount: bookmarks.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
