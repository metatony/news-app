// ignore_for_file: prefer_const_constructors

import 'package:news_app/api/apple_news.dart';
import 'package:news_app/models/apple_model.dart';
import 'package:news_app/utilities/exports.dart';

class AppleTabBarView extends StatefulWidget {
  const AppleTabBarView({super.key});

  @override
  State<AppleTabBarView> createState() => _AppleTabBarViewState();
}

class _AppleTabBarViewState extends State<AppleTabBarView> {
  List<AppleNews> _appleNews = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  _getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    _appleNews = newsClass.appleNews;
    setState(() {
      _loading = false;
    });
  }

  //url launcher
  Future<void> _launchURL({required Uri uri}) async {
    if (!await launchUrl(uri)) {
      throw 'could not launch $uri';
      
      
    }await launchUrl(uri, mode: LaunchMode.inAppWebView);
    
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
              itemCount: _appleNews.length,
              itemBuilder: (context, index) {

                return Container(
                  padding: EdgeInsets.all(8),
                  height: 100.h,
                  width: 264.w,
                  child: InkWell(
                    onTap: () {
                     final url = Uri.parse(_appleNews[index].url);
                      _launchURL(uri: url);
                   
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: _appleNews[index].urlToImage,
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
                                  _appleNews[index].title,
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                              Text(_appleNews[index].publisher,
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
