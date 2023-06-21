// ignore_for_file: prefer_const_constructors

import '../utilities/exports.dart';

class BigNewsCard extends StatelessWidget {
  const BigNewsCard({
    super.key,
  });

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
                child:
                    Container(height: 183.h, width: 364.w, color: Colors.grey)),
            SizedBox(height: 8.h),
            Text(
              'Europe',
              style: smallText,
            ),
            Text(
              'Russian warship: Moskva sinks in Black Sea',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
