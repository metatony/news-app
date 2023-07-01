// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:news_app/utilities/exports.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({
    super.key,
    required List<HeadlineNews> headlineNews,
  }) : _headlineNews = headlineNews;

  final List<HeadlineNews> _headlineNews;

  //this url launcher is for desktop platform. not for android/iOS.
  Future<void> _launchURL({required Uri uri}) async {
    if (!await canLaunchUrl(uri)) {
      throw 'could not launch $uri';
    }
    await launchUrl(uri, mode: LaunchMode.inAppWebView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                    color: Colors.transparent,
                  ),
                ],
              ),
              vHeight,
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _headlineNews.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        final url = Uri.parse(_headlineNews[index].url);
                        _launchURL(uri: url);
                      },
                      child: BigNewsCard(
                        url: _headlineNews[index].url,
                        title: _headlineNews[index].title,
                        image: _headlineNews[index].urlToImage,
                        author: _headlineNews[index].author,
                        publisher: _headlineNews[index].publisher,
                      ),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
