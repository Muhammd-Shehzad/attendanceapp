import 'package:attendanceapp/UI/AttandanceScreen/attandance_screen_provider.dart';
import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/EnterStudentDetails/enter_student_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AttandacneScreen extends StatefulWidget {
  const AttandacneScreen({super.key});

  @override
  State<AttandacneScreen> createState() => _AttandacneScreenState();
}

class _AttandacneScreenState extends State<AttandacneScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AttandanceScreenProvider(),
      child: Consumer<AttandanceScreenProvider>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: -80.h,
                      left: -70.w,
                      child: Image.asset(
                        'assets/login.png',
                        height: 210.h,
                        width: 230.w,
                      ),
                    ),
                    Positioned(
                      top: 60.h,
                      left: 110.w,
                      right: 10.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.close),
                          hintText: 'Search...',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130.h,
                      left: 100.w,
                      
                      child: Container(
                        height: 10.h,
                        width: 50.w,
                        color: Colors.amber,
                      ),
                    ),
                    Positioned(
                      top: 140.h,
                      left: 105.w,
                      right: 105.w,
                      child: Text(
                        'Student Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 550.h,
                      left: 30.w,
                      right: 30.w,
                      child: Button(
                        onPressed: () {
                          Get.to(EnterStudentDetails());
                        },
                        text: 'Add New Students',
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
        ),
      ),
    );
  }
}
