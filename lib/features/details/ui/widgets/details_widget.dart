import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/features/bookmark/repository/bookmark_repository.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

class DetailsWidget extends StatelessWidget {
  final News news;
  const DetailsWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final BookmarkRepository bookmarkRepo = BookmarkRepository();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          StreamBuilder<List<String>>(
            stream: bookmarkRepo.streamBookmakIds(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.bookmark_border_rounded),
                );
              }

              final isBookmarked = snapshot.data!.contains(news.id);

              return IconButton(
                onPressed: () async {
                  final uid = FirebaseAuth.instance.currentUser?.uid;
                  if (uid == null) return;

                  final docRef = FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .collection('bookmarks')
                      .doc(news.id);

                  try {
                    if (isBookmarked) {
                      await docRef.delete();
                      Fluttertoast.showToast(msg: "Removed from bookmark");
                    } else {
                      await docRef.set(news.toJson());
                      Fluttertoast.showToast(msg: "Added to bookmark");
                    }
                  } catch (e) {
                    print(e);
                    Fluttertoast.showToast(msg: "Error: ${e.toString()}");
                  }
                },
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border_rounded,
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    news.source.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    DateFormat('yMMMd').format(news.publishedAt),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 250,
              child: news.urlToImage != null
                  ? Image.network(
                      news.urlToImage!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      Assets.noImage,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                news.author!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                news.title!,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 24,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                news.description!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                news.content!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
