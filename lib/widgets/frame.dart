// ignore_for_file: prefer_const_constructors

import '../utilities/exports.dart';

class Frame extends StatelessWidget {
  const Frame({
    super.key,
    required this.title, this.onTap,
  });

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
          InkWell(
            onTap: onTap,
            child: Text('See all',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xff4E4B66))),
          ),
        ],
      ),
    );
  }
}
