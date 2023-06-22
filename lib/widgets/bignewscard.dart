// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';

import '../utilities/exports.dart';

class BigNewsCard extends StatelessWidget {
   BigNewsCard({
    super.key,
    required this.title,
    this.description,
    required this.image,
  });

  final String title, image;
  String? description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        //color: Colors.red,
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 183.h,
                width: 364.w,
                child: CachedNetworkImage(imageUrl: image, fit: BoxFit.cover,)
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: smallText,
            ),
           // Text(
           //   description,
           //   style: TextStyle(fontWeight: FontWeight.w600),
           // ),
          ],
        ),
      ),
    );
  }
}
