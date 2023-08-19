// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:news_app/theme/dark_theme.dart';
import 'package:news_app/theme/light_theme.dart';
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
      useInheritedMediaQuery: true,
      designSize: Size(428, 926),
      minTextAdapt: true,
      builder: (BuildContext context, child) => MaterialApp(
        darkTheme: darkTheme,
        theme: lightTheme,   
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
