// ignore_for_file: prefer_const_constructors



import 'package:news_app/models/tesla_model.dart';
import 'package:news_app/screens/tabs/tesla_tab.dart';

import '../../utilities/exports.dart';

class TabBarSection extends StatelessWidget {
   const TabBarSection({
    super.key,
    required List<TrendingNews> trendingNews,
  }) : _trendingNews = trendingNews; 

  final List<TrendingNews> _trendingNews;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.symmetric(horizontal: 5.5.w),
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
                    AllTabBarView(trendingNews: _trendingNews),
                    TeslaTabBarView(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
