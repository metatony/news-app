import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/headline_model.dart';

class News {
  List<HeadlineNews> headlineNews = [];

  Future<void> getNews() async {
    // get api key from news.org
    String url = 'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=6d18482b6ce244cca73a6f19a42e926b';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var eachNews in jsonData['articles']) {
        final headlineList = HeadlineNews(
          url: eachNews['url'] ?? 'No data Available',
          title: eachNews['title'] ?? 'No data Available',
          urlToImage: eachNews['urlToImage'] ?? 'No data Available',
          publisher: eachNews['source']['name'] ?? 'No data Available',
          author: eachNews['author'] ?? 'No data Available',
        );
        headlineNews.add(headlineList);
      }
    } else {
      throw Exception('failed to fetch data');
    }
  }
}
