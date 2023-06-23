import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/trending_model.dart';

class News {
  List<TrendingNews> trendingNews = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6d18482b6ce244cca73a6f19a42e926b';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var eachNews in jsonData['articles']) {
        final trendList = TrendingNews(
          title: eachNews['title'] ?? 'No data Available',
          urlToImage: eachNews['urlToImage'] ?? 'No data Available',
          publisher: eachNews['source']['name'] ?? 'No data Available',
          author: eachNews['author'] ?? 'No data Available',
        );
        trendingNews.add(trendList);
        print(response.statusCode);
      }
    } else {
      throw Exception('failed to fetch data');
    }
  }
}
