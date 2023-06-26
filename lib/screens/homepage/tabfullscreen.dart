// ignore_for_file: prefer_const_constructors

import 'package:news_app/screens/tabs/tab_header.dart';
import 'package:news_app/utilities/exports.dart';

class TabFullScreen extends StatelessWidget {
  const TabFullScreen({
    super.key,
    required List<HeadlineNews> headlineNews,
  }) : _headlineNews = headlineNews;

  final List<HeadlineNews> _headlineNews;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SafeArea(
            child: Column(
              children: [
                
                MyAppbar(),
                vHeight,
                Frame(title: 'Latest'),
                Expanded(
                  child: TabBarSection(headlineNews: _headlineNews),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
