import 'package:attendanceapp/UI/BatchDetails/batch_details.dart';
import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/EnterStudentDetails/enter_student_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EnterStudentDetails extends StatefulWidget {
  const EnterStudentDetails({super.key});

  @override
  State<EnterStudentDetails> createState() => _EnterStudentDetailsState();
}

class _EnterStudentDetailsState extends State<EnterStudentDetails> {
  bool isOpen = false;
  String selectOption = 'Enter Batch Name';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EnterStudentDetailsProvider(),
      child: Consumer<EnterStudentDetailsProvider>(
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
                      top: 120.h,
                      left: 20.w,
                      right: 20.w,
                      child: Column(
                        children: [
                          Text(
                            'Enter Students Detals',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width: 350.w,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isOpen = !isOpen;
                                    });
                                  },
                                  child: Container(
                                    height: 50.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              selectOption.isNotEmpty
                                                  ? selectOption
                                                  : 'Enter Batch Name',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Icon(isOpen
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down),
                                      ],
                                    ),
                                  ),
                                ),
                                if (isOpen)
                                  Container(
                                    width: 310.w,
                                    constraints: BoxConstraints(
                                      maxHeight: 90.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 4,
                                          spreadRadius: 2,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: ListView(
                                      primary: false,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      children: model.batch
                                          .map(
                                            (e) => InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectOption = e;
                                                  isOpen = false;
                                                });
                                              },
                                              child: Container(
                                                height: 30.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  e,
                                                  style: TextStyle(
                                                      fontSize: 14.sp),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Name',
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
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Domain',
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
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Gender',
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
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
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
                          Button(
                            onPressed: () {
                              Get.to(BatchDetails());
                            },
                            text: 'Save',
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
