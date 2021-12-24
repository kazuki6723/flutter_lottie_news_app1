import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_lottie_app1/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle(String str) async {
    final queryParameters = {
      // 'country': 'us',
      'q': str,
      'sortBy': 'popularity',
      'apiKey': '62eb4219560e4952b2bb3b31c7c5e4a6'
    };

    final uri = Uri.https(endPointUrl, '/v2/everything', queryParameters);
    // const String url = 'https://newsapi.org/v2/everything?q=technology&pageSize=10&sortBy=popularity&apiKey=62eb4219560e4952b2bb3b31c7c5e4a6';
    // final uri = Uri.parse(url);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}