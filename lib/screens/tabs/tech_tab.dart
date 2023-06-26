// ignore_for_file: prefer_const_constructors

import 'package:news_app/api/tech_news.dart';
import 'package:news_app/models/tech_model.dart';
import 'package:news_app/utilities/exports.dart';

class TechTabBarView extends StatefulWidget {
  const TechTabBarView({super.key});

  @override
  State<TechTabBarView> createState() => _TechTabBarViewState();
}

class _TechTabBarViewState extends State<TechTabBarView> {
  List<TechNews> _techNews = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  _getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    _techNews = newsClass.techNews;
    setState(() {
      _loading = false;
    });
  }

  //this url launcher is for desktop platform. not for android/iOS.
  Future<void> _launchURL({required Uri uri}) async {
    if (!await canLaunchUrl(uri)) {
      throw 'could not launch $uri';
    }
    await launchUrl(uri, mode: LaunchMode.inAppWebView);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: _loading
          ? Center(
              child: SpinKitWave(
                size: 25,
                color: Colors.blue,
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: _techNews.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  height: 100.h,
                  width: 264.w,
                  child: InkWell(
                    onTap: () {
                      final url = Uri.parse(_techNews[index].url);
                      _launchURL(uri: url);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: _techNews[index].urlToImage,
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
                                  _techNews[index].title,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              Text(_techNews[index].publisher,
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.blue))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
