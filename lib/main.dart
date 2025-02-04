import 'package:attendanceapp/UI/SplashScreen/splash_screen.dart';
import 'package:attendanceapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );



  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: false,
      minTextAdapt: false,
      builder: (context, child) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    ),
  );
}
