// ignore_for_file: prefer_const_constructors

import '../utilities/exports.dart';

class BigNewsCard extends StatelessWidget {
  const BigNewsCard({
    super.key,
    required this.title,
    required this.image,
    required this.author,
    required this.publisher, required this.url,
  });

  final String title, url, image, author, publisher;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
                height: 183.h,
                width: 364.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                    ))),
          ),
          SizedBox(height: 8.h),
          Text(title, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Theme.of(context).colorScheme.primary)),
          Row(
            children: [
              Text(publisher,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Colors.blue)),
              width,
              vHeight,
            ],
          ),
        ],
      ),
    );
  }
}

// .length > 5 ? '${title.substring(0, 55)}...' : title,