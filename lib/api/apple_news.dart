import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/apple_model.dart';

class News {
  List<AppleNews> appleNews = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/everything?q=apple&from=2023-06-23&to=2023-06-23&sortBy=popularity&apiKey=6d18482b6ce244cca73a6f19a42e926b';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var eachNews in jsonData['articles']) {
        final appleList = AppleNews(
          url: eachNews['url'] ?? 'No data Available',
          title: eachNews['title'] ?? 'No data Available',
          urlToImage: eachNews['urlToImage'] ?? 'No data Available',
          publisher: eachNews['source']['name'] ?? 'No data Available',
          author: eachNews['author'] ?? 'No data Available',
        );
        appleNews.add(appleList);
        //print(response.statusCode);
      }
    } else {
      throw Exception('failed to fetch data');
    }
  }
}
