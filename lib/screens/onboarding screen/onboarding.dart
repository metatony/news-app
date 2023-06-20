// ignore_for_file: prefer_const_constructors

import 'package:news_app/models/list.dart';
import 'package:news_app/screens/homepage/homepage.dart';
import 'package:news_app/screens/onboarding%20screen/pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utilities/exports.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = PageController(viewportFraction: 1.0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (context, int index) {
                    return Pages(
                      body: pages[index]['body'],
                      header: pages[index]['header'],
                      image: pages[index]['image'],
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: pages.length,
                      effect: SwapEffect(
                        activeDotColor: Color(0xff1877F2),
                        dotHeight: 10.h,
                        dotWidth: 10.w,
                        type: SwapType.yRotation,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.page! < pages.length - 1) {
                          controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                            color: Color(0xff1877F2),
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
