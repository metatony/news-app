// ignore_for_file: prefer_const_constructors

import '../../../utilities/exports.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({
    super.key,
    required List<HeadlineNews> headlineNews,
  }) : _headlineNews = headlineNews;

  final List<HeadlineNews> _headlineNews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(horizontal: 5.5.w),
            labelColor: Theme.of(context).colorScheme.secondary,
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
                AllTabBarView(headlineNews: _headlineNews),
                TeslaTabBarView(),
                AppleTabBarView(),
                TechTabBarView(),
                WallStreetTabBarView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
