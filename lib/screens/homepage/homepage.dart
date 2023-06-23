// ignore_for_file: prefer_const_constructors

import 'package:news_app/helpers/trending_news.dart';
import 'package:news_app/models/list.dart';
import 'package:news_app/models/trending_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utilities/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TrendingNews> _trendingNews = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  _getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    _trendingNews = newsClass.trendingNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
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
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('images/Vector (1).png'),
                            Icon(FeatherIcons.bell)
                          ],
                        ),
                      ),
                      vHeight,
                      Frame(title: 'Trending'),
                      vHeight,
                      BigNewsCard(
                        title: _trendingNews[4].title,
                        image: _trendingNews[4].urlToImage,
                        publisher: _trendingNews[4].publisher,
                        author: _trendingNews[4].author,
                      ),
                      SizedBox(height: 10),
                      Frame(title: 'Latest'),
                      Expanded(
                        child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [


                                TabBar(
                                  isScrollable: true,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelPadding:
                                      EdgeInsets.symmetric(horizontal: 5.5.w),
                                  labelColor: Colors.black,
                                  tabs: [
                                    ...List.generate(
                                      newsLabel.length,
                                      (index) {
                                        return Tab(
                                          text: newsLabel[index],
                                        );
                                      },
                                    ),
                                  ],
                                  indicator: DotIndicator(
                                      radius: 3.r,
                                      distanceFromCenter: 16.h,
                                      paintingStyle: PaintingStyle.fill),
                                ),
                                SizedBox(height: 10),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Expanded(
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              _trendingNews[
                                                                      index]
                                                                  .urlToImage,
                                                          height: 90,
                                                          width: 80,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      width,
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                _trendingNews[
                                                                        index]
                                                                    .title,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14.sp),
                                                              ),
                                                            ),
                                                            Text(
                                                                _trendingNews[
                                                                        index]
                                                                    .publisher,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .blue))
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
