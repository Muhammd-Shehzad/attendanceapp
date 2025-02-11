import 'package:attendanceapp/UI/Auth/Login/login_screen.dart';
import 'package:attendanceapp/UI/Home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  void splashscreen() {
    Future.delayed(const Duration(seconds: 3), () {
      final user = auth.currentUser;
      if (user != null) {
        Get.off(const HomeScreen());
      } else {
        Get.off(const LoginScreen());
      }
    });
  }
}
