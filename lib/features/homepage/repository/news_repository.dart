import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsRepository {
  final Dio _dio = Dio();
  Future<dynamic> fetchNews() async {
    // Simulate a network call

    final res = await _dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=${dotenv.env['News_API_Key']}');
    return Right(res);
  }
}
