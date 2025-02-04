import 'package:attendanceapp/UI/AttandanceScreen/attandance_screen_provider.dart';
import 'package:attendanceapp/UI/BatchDetails/batch_details.dart';
import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/PiChartScreen/pi_chart_screen.dart';
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
                      top: 50.h,
                      left: 110.w,
                      right: 10.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: const Icon(Icons.close),
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
                      left: 105.w,
                      right: 105.w,
                      child: Center(
                        child: Text(
                          'Attandance',
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
                        height: 360.h,
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
                      top: 495.h,
                      left: 30.w,
                      right: 30.w,
                      child: Button(
                        onPressed: () {
                          Get.to(
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Save!',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    content: SizedBox(
                                      height: 60.h,
                                      width: 250.w,
                                      child: Column(
                                        children: [
                                          Text(
                                            'Present: 15',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Absent: 5',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.to(const PiChartScreen());
                                        },
                                        child: const Text('Save'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  );
                                }),
                          );
                        },
                        text: 'Save',
                      ),
                    ),
                    Positioned(
                      top: 557.h,
                      left: 30.w,
                      right: 30.w,
                      child: Button(
                        onPressed: () {
                          Get.to(const PiChartScreen());
                        },
                        text: 'view attendance',
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
