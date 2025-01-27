import 'package:attendanceapp/UI/Auth/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashProvider extends ChangeNotifier {

void splashscreen() {

    Future.delayed(Duration(seconds: 3),(){

      Get.to(LoginScreen());
      
    });


  }





}