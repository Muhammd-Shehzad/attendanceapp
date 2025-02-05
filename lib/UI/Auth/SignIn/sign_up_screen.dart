import 'package:attendanceapp/UI/Auth/Login/login_screen.dart';
import 'package:attendanceapp/UI/Auth/SignIn/sign_up_screen_provider.dart';
import 'package:attendanceapp/UI/Home/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contex) => SignUpScreenProvider(),
      child: Consumer<SignUpScreenProvider>(
        builder: (context, model, child) => Scaffold(
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
                      top: 260.h,
                      left: 20.w,
                      right: 20.w,
                      child: Column(
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            controller: model.emailController,
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
                            controller: model.passwordController,
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
                          // SizedBox(
                          //   height: 20.h,
                          // ),
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //     hintText: 'Enter your Re-password',
                          //     filled: true,
                          //     fillColor: Colors.grey[200],
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(30),
                          //       borderSide: BorderSide.none,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              model.signUp();
                              Get.to(const HomeScreen());
                            },
                            child: model.isloading
                                ? CircularProgressIndicator()
                                : Container(
                                    height: 50.h,
                                    width: 320.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF5AB7B7),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text.rich(TextSpan(
                            children: [
                              const TextSpan(text: 'Do you have account'),
                              WidgetSpan(
                                child: SizedBox(
                                  width: 10.w,
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(const LoginScreen());
                                  },
                                text: 'Login',
                                style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          )),
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
                    Positioned(
                      top: 50.h,
                      left: 30.w,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
