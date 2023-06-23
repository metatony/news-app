// ignore_for_file: prefer_const_constructors

import 'package:news_app/helpers/trending_news.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/screens/tabs/tabbar.dart';

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
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SafeArea(
            child: _loading
                ? Center(
                    child: SpinKitWave(
                      color: Colors.blue,
                    ),
                  )
                : Column(
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
                      BigNewsCard(
                        title: _trendingNews[4].title,
                        image: _trendingNews[4].urlToImage,
                        publisher: _trendingNews[4].publisher,
                        author: _trendingNews[4].author,
                      ),
                      SizedBox(height: 10),
                      Frame(title: 'Latest'),
                      TabBarSection(trendingNews: _trendingNews),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
