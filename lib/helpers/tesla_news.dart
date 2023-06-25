import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/tesla_model.dart';

class News {
  List<TeslaNews> teslaNews = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/everything?q=tesla&from=2023-05-24&sortBy=publishedAt&apiKey=6d18482b6ce244cca73a6f19a42e926b';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var eachNews in jsonData['articles']) {
        final trendList = TeslaNews(
          title: eachNews['title'] ?? 'No data Available',
          urlToImage: eachNews['urlToImage'] ?? 'No data Available',
          publisher: eachNews['source']['name'] ?? 'No data Available',
          author: eachNews['author'] ?? 'No data Available', 
          url: eachNews['url'] ?? 'No data Available',
        );
        teslaNews.add(trendList);
      }
    } else {
      throw Exception('failed to fetch data');
    }
  }
}
