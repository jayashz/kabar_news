import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kabar_news/features/homepage/model/news.dart';

class NewsRepository {
  final Dio _dio = Dio();
  Future<Either<String, List<News>>> fetchNews() async {
    // Simulate a network cal
    try {
      final res = await _dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=${dotenv.env['News_API_Key']}');

      final tempNews =
          List.from(res.data['articles']).map((e) => News.fromJson(e)).toList();

      return Right(tempNews);
    } catch (e) {
      return Left("Unable to fetch news");
    }
  }
}
