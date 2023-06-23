// ignore_for_file: prefer_const_constructors

import 'package:news_app/helpers/tesla_news.dart';
import 'package:news_app/models/tesla_model.dart';
import 'package:news_app/utilities/exports.dart';

class TeslaTabBarView extends StatefulWidget {
  const TeslaTabBarView({super.key});

  @override
  State<TeslaTabBarView> createState() => _TeslaTabBarViewState();
}

class _TeslaTabBarViewState extends State<TeslaTabBarView> {
  List<TeslaNews> _teslaNews = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  _getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    _teslaNews = newsClass.teslaNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _teslaNews.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8),
                height: 100.h,
                width: 264.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: _teslaNews[index].urlToImage,
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
                              _teslaNews[index].title,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                          Text(_teslaNews[index].publisher,
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.blue))
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
