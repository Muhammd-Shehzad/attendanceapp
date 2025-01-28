import 'package:attendanceapp/UI/Home/home_screen.dart';
import 'package:attendanceapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: -80,
                  left: -70,
                  child: Image.asset(
                    'assets/login.png',
                    height: 210.h,
                    width: 230.w,
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 5,
                  child: Image.asset(
                    'assets/login1.png',
                    height: 260.h,
                    width: 260.w,
                  ),
                ),
                Positioned(
                  top: 300.h,
                  left: 20.w,
                  right: 20.w,
                  child: Column(
                    children: [
                      Text(
                        'Admin Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(HomeScreen());
                        },
                        child: Container(
                          height: 50.h,
                          width: 320.w,
                          decoration: BoxDecoration(
                            color: Color(0xFF5AB7B7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 607.h,
                  right: 10.w,
                  child: Image.asset(
                    'assets/SplashScrren2.png',
                    height: 80.h,
                    width: 80.w,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
