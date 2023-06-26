// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:news_app/screens/homepage/homepage.dart';
import 'utilities/exports.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
      enabled: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      minTextAdapt: true,
      builder: (BuildContext context, child) => MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
            fontFamily: GoogleFonts.poppins().fontFamily),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
