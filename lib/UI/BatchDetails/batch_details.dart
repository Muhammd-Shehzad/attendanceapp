import 'package:attendanceapp/UI/BatchDetails/batch_details_provider.dart';
import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/Custom/text_rich.dart';
import 'package:attendanceapp/UI/EditScreen/edit_screen.dart';
import 'package:attendanceapp/UI/StudentDetails/student_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BatchDetails extends StatefulWidget {
  const BatchDetails({super.key});

  @override
  State<BatchDetails> createState() => _BatchDetailsState();
}

class _BatchDetailsState extends State<BatchDetails> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BatchDetailsProvider(),
      child: Consumer<BatchDetailsProvider>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      right: 5,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(EditScreen());
                            },
                            child: InkWell(
                              child: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.teal,
                          ),
                        ],
                      ),
                    ),
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
                      top: 120.h,
                      left: 20.w,
                      right: 20.w,
                      child: Column(
                        children: [
                          Text(
                            'Batch Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextRich(
                            text1: 'Batch Name:',
                            text2: ' Shehzad',
                          ),
                          TextRich(
                            text1: 'Location:',
                            text2: ' Charsadda Road ',
                          ),
                          TextRich(
                            text1: 'No Students:',
                            text2: ' 30 ',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Batch Lead Details',
                              style: TextStyle(
                                  color: Color(0xFF5AB7B7), fontSize: 20.sp),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextRich(
                            text1: 'Batch Leader:',
                            text2: ' Talha Iqbal',
                          ),
                          TextRich(
                            text1: 'Mobil No:',
                            text2: ' 03xxxxxxxxx',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Button(
                            onPressed: () {},
                            text: 'Attandance',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Button(
                            onPressed: () {
                              Get.to(StudentDetails());
                            },
                            text: 'Student Details',
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
