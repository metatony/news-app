
// ignore_for_file: prefer_const_constructors

import 'package:news_app/utilities/exports.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('images/Vector (1).png'),
          Icon(FeatherIcons.bell)
        ],
      ),
    );
  }
}
