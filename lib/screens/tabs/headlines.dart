// ignore_for_file: prefer_const_constructors

import 'package:news_app/utilities/exports.dart';

class AllTabBarView extends StatelessWidget {
  const AllTabBarView({
    super.key,
    required List<HeadlineNews> headlineNews,
  }) : _headlineNews = headlineNews;

  final List<HeadlineNews> _headlineNews;

  //url launcher
  Future<void> _launchURL({required Uri uri}) async {
    if (!await launchUrl(uri)) {
      throw 'could not launch $uri';
    }
    await launchUrl(uri, mode: LaunchMode.inAppWebView);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _headlineNews.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8),
              height: 100.h,
              width: 264.w,
              child: InkWell(
                onTap: () {
                  final url = Uri.parse(_headlineNews[index].url);
                  _launchURL(uri: url);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: _headlineNews[index].urlToImage,
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
                              _headlineNews[index].title,
                              maxLines: 2,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                          Text(_headlineNews[index].publisher,
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
