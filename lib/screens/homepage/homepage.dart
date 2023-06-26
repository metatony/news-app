// ignore_for_file: prefer_const_constructors

import 'package:news_app/api/headlines_news.dart';
import 'package:news_app/screens/homepage/tabfullscreen.dart';
import 'package:news_app/screens/homepage/trending_page.dart';
import 'package:news_app/screens/tabs/tab_header.dart';

import '../../utilities/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HeadlineNews> _headlineNews = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  _getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    _headlineNews = newsClass.headlineNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                      MyAppbar(),
                      vHeight,
                      Frame(title: 'Trending', onTap: () {
                         Navigator.push(
                      context,
                      PageTransition(
                        duration: Duration(milliseconds: 600),
                        type: PageTransitionType.bottomToTop,
                        child: TrendingScreen(headlineNews: _headlineNews),
                      ),
                    );
                      },),
                      vHeight,
                      BigNewsCard(
                        title: _headlineNews[3].title,
                        image: _headlineNews[3].urlToImage,
                        publisher: _headlineNews[3].publisher,
                        author: _headlineNews[3].author,
                      ),
                      SizedBox(height: 10),
                      Frame(title: 'Latest', onTap: () {
                        Navigator.push(
                      context,
                      PageTransition(
                        duration: Duration(milliseconds: 600),
                        type: PageTransitionType.bottomToTop,
                        child: TabFullScreen(headlineNews: _headlineNews,),
                      ),
                    );
                      },),
                      Expanded(
                          child: TabBarSection(headlineNews: _headlineNews)),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
