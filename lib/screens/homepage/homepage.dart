// ignore_for_file: prefer_const_constructors

import 'package:news_app/helpers/trending_news.dart';
import 'package:news_app/models/trending_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utilities/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TrendingNews> _trendingNews = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  _getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    _trendingNews = newsClass.trendingNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: _loading
              ? Center(
                child: Container(
                    child: SpinKitWave(
                      color: Colors.blue,
                    ),
                  ),
              )
              : ListView(
                  children: [
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/Vector (1).png'),
                          Icon(FeatherIcons.bell)
                        ],
                      ),
                    ),
                    vHeight,
                    Frame(title: 'Trending'),
                    vHeight,
                    ListView.builder(
                      shrinkWrap: true,
                        itemCount: _trendingNews.length,
                        itemBuilder: (context, index) {
                          return BigNewsCard(
                              title: _trendingNews[index].title,
                              //description: _trendingNews[index].description,
                              image: _trendingNews[index].urlToImage,
                              );
                        })
                  ],
                ),
        ),
      ),
    );
  }
}
