// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:news_app/utilities/exports.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({
    super.key,
    required List<HeadlineNews> headlineNews,
  }) : _headlineNews = headlineNews;

  final List<HeadlineNews> _headlineNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: ListView(
            children: [
              vHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(FeatherIcons.arrowLeft),
                  ),
                  Text('Trending',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp)),
                  Icon(
                    FeatherIcons.arrowLeft,
                    color: Colors.white,
                  ),
                ],
              ),
              vHeight,
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _headlineNews.length,
                  itemBuilder: ((context, index) {
                    return BigNewsCard(
                      title: _headlineNews[index].title,
                      image: _headlineNews[index].urlToImage,
                      author: _headlineNews[index].author,
                      publisher: _headlineNews[index].publisher,
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
