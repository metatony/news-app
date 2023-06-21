// ignore_for_file: prefer_const_constructors

import 'package:news_app/utilities/exports.dart';

class Pages extends StatelessWidget {
  const Pages({
    super.key,
    required this.image,
    required this.body,
    required this.header,
  });

  final String image, body, header;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 550.h,
                width: double.infinity,
              ),
            ),
            Container(
              width: 318,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text(body,
                  style: TextStyle(fontSize: 18.sp)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
