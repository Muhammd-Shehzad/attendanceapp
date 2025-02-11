import 'package:attendanceapp/UI/AbsentStudentList/absent_student.dart';
import 'package:attendanceapp/UI/Graph/graph_Screen.dart';
import 'package:attendanceapp/UI/PresentStudentList/present_student.dart';
import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/PiChartScreen/pi_chart_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class PiChartScreen extends StatefulWidget {
  const PiChartScreen({super.key});

  @override
  State<PiChartScreen> createState() => _PiChartScreenState();
}

class _PiChartScreenState extends State<PiChartScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PiChartScreenProvider(),
      child: Consumer<PiChartScreenProvider>(
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
                        top: 110.h,
                        left: 20.w,
                        right: 20.w,
                        child: Center(
                          child: Text(
                            '3 Febuary 2025',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        )),
                    Positioned(
                      top: 140.h,
                      left: 20.w,
                      right: 20.w,
                      child: Column(
                        children: [
                          Text(
                            'Attendance',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Positioned(
                            top: 110.h,
                            left: 20.w,
                            right: 20.w,
                            child: Center(
                              child: Text(
                                'Batch# 1',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 40),
                            child: PieChart(
                              dataMap: model.batchData,
                              colorList: model.colorList,
                              centerText: 'Betach 1',
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Button(
                            onPressed: () {
                              Get.to(const PresentStudent());
                            },
                            text: 'Presnt Students',
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Button(
                            onPressed: () {
                              Get.to(const AbsentStudent());
                            },
                            text: 'Absent Students',
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Button(
                            onPressed: () {
                              Get.to(const GraphScreen());
                            },
                            text: 'Graph of Students',
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
        ),
      ),
    );
  }
}
