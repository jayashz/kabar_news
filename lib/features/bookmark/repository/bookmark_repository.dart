import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

class BookmarkRepository {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Stream<List<String>> streamBookmakIds() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('bookmarks')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) => doc.id).toList(),
        );
  }

  Stream<List<News>> streamBookmarks() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('bookmarks')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => News.fromJson(doc.data())).toList());
  }
}
