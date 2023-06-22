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

    if (jsonData['status'] == 'ok') {
      for (var eachNews in jsonData['articles']) {
        final trend = TrendingNews(
          title: eachNews['title'] ?? 'No Title Available'  ,
          urlToImage: eachNews['urlToImage'] ?? 'No Title Available',
          //description: eachNews['description'] ?? 'No Title Available',
        );
        trendingNews.add(trend);
      }
    } else {
      throw Exception('failed to fetch data');
    } 
  }


}
