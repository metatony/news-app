// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'utilities/exports.dart';


void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
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
        theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
    
  }
}
