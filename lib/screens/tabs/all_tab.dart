// ignore_for_file: prefer_const_constructors

import 'package:news_app/utilities/exports.dart';

class AllTabBarView extends StatelessWidget {
  const AllTabBarView({
    super.key,
    required List<TrendingNews> trendingNews,
  }) : _trendingNews = trendingNews;

  final List<TrendingNews> _trendingNews;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _trendingNews.length,
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
                        imageUrl: _trendingNews[index].urlToImage,
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
                              _trendingNews[index].title,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                          Text(_trendingNews[index].publisher,
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
