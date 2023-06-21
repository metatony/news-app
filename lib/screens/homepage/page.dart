import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text('test'))),
    );
  }
}

// TabBar(
//                   indicatorSize: TabBarIndicatorSize.label,
//                   labelPadding: EdgeInsets.symmetric(horizontal: 1.w),
//                   labelColor: Colors.black,
//                   tabs: [
//                     ...List.generate(
//                       newsLabel.length,
//                       (index) {
//                         return Tab(
//                           text: newsLabel[index],
//                         );
//                       },
//                     ),
//                   ],
//                   indicator: DotIndicator(
//                       radius: 3.r,
//                       distanceFromCenter: 16.h,
//                       paintingStyle: PaintingStyle.fill),
//                 ),
//                 TabBarView(
//                   children: [
//                     Test(),
//                     Test(),
//                     Test(),
//                     Test(),
//                     Test(),
//                   ],
//                 ),