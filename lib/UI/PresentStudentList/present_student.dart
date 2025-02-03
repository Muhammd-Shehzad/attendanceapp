import 'package:attendanceapp/UI/PresentStudentList/present_student_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PresentStudent extends StatefulWidget {
  const PresentStudent({super.key});

  @override
  State<PresentStudent> createState() => _PresentStudentState();
}

class _PresentStudentState extends State<PresentStudent> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PresentStudentProvider(),
      child: Consumer<PresentStudentProvider>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        top: 50.h,
                        left: 15.w,
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 30.sp,
                            color: Colors.black,
                          ),
                        )),
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
                      top: 50.h,
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
                      top: 100.h,
                      left: 20.w,
                      right: 20.w,
                      child: Center(
                        child: Text(
                          'Present Students',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130.h,
                      left: 30.w,
                      right: 30.w,
                      child: SizedBox(
                        height: 500.h,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50.h,
                                width: 380.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '01',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.sp),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'Shehzad Ali  Shah',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.sp),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'P',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
