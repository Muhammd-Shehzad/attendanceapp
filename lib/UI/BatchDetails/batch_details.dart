import 'package:attendanceapp/UI/AttandanceScreen/attandacne_screen.dart';
import 'package:attendanceapp/UI/BatchDetails/batch_details_provider.dart';
import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/Custom/text_rich.dart';
import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:attendanceapp/UI/EditScreen/edit_screen.dart';
import 'package:attendanceapp/UI/StudentDetails/student_details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BatchDetails extends StatefulWidget {
  BatchDetails({
    super.key,
    this.Batch_Name,
    this.Batch_location,
    this.Student_Number,
    this.Leader_Name,
    this.Leader_No,
    this.id,
  });
  final Batch_Name;
  final Batch_location;
  final Student_Number;
  final Leader_Name;
  final Leader_No;
  final id;

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
                              Get.to(EditScreen(
                                batchName: widget.Batch_Name,
                                locations: widget.Batch_location,
                                studentNo: widget.Student_Number,
                                teacherName: widget.Leader_Name,
                                teacherNo: widget.Leader_No,
                              ));
                            },
                            child: const InkWell(
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
                          InkWell(
                            onTap: () {
                              final dbAddBatches =
                                  FirebaseDatabase.instance.ref('AddBatch');
                              dbAddBatches.child(widget.id).remove().then((v) {
                                ToastPopup().toast(
                                    'Data Deleted', Colors.green, Colors.white);

                                Get.back();
                              }).onError((Eror, v) {
                                ToastPopup()
                                    .toast(Error, Colors.red, Colors.white);
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.teal,
                            ),
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
                            text1: 'Batch Name: ',
                            text2: widget.Batch_Name, // Using Passed Batch Name
                          ),
                          TextRich(
                            text1: 'Location: ',
                            text2: widget
                                .Batch_location, // Using Passed Batch Name
                          ),
                          TextRich(
                            text1: 'Students No: ',
                            text2: widget
                                .Student_Number, // Using Passed Batch Name
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Batch Lead Details',
                              style: TextStyle(
                                  color: const Color(0xFF5AB7B7),
                                  fontSize: 20.sp),
                            ),
                          ),
                          TextRich(
                            text1: 'Leader Name: ',
                            text2:
                                widget.Leader_Name, // Using Passed Batch Name
                          ),
                          TextRich(
                            text1: 'Leader No: ',
                            text2: widget.Leader_No, // Using Passed Batch Name
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Button(
                            onPressed: () {
                              Get.to(const AttandacneScreen());
                            },
                            text: 'Attandance',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Button(
                            onPressed: () {
                              Get.to(const StudentDetails());
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
                    Positioned(
                      top: 60.h,
                      left: 40.w,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
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
