// ignore_for_file: prefer_const_constructors

import 'package:news_app/helpers/wallstreet_news.dart';
import 'package:news_app/models/wallstreet_model.dart';
import 'package:news_app/utilities/exports.dart';

class WallStreetTabBarView extends StatefulWidget {
  const WallStreetTabBarView({super.key});

  @override
  State<WallStreetTabBarView> createState() => _WallStreetTabBarViewState();
}

class _WallStreetTabBarViewState extends State<WallStreetTabBarView> {
  List<WallStreetNews> _wallStreetNews = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  _getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    _wallStreetNews = newsClass.wallStreetNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _wallStreetNews.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8),
              height: 100.h,
              width: 264.w,                child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: _wallStreetNews[index].urlToImage,
                      height: 90,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  width,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _wallStreetNews[index].title,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                        Text(_wallStreetNews[index].publisher,
                            style: TextStyle(
                                fontSize: 12.sp, color: Colors.blue))
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
