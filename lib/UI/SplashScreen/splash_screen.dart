import 'package:attendanceapp/UI/SplashScreen/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SplashProvider().splashscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: Consumer<SplashProvider>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                  child: Image.asset(
                'assets/SplashScreen1.png',
                width: 320.w,
                fit: BoxFit.cover,
              )),
              SizedBox(
                height: 40.h,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/SplashScrren2.png',
                  width: 360.w,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
