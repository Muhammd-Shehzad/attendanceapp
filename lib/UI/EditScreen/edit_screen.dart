import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:attendanceapp/UI/EditScreen/edith_screen_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  EditScreen(
      {super.key,
      this.batchName,
      this.locations,
      this.studentNo,
      this.teacherName,
      this.teacherNo,
      this.id});

  final batchName;
  final locations;
  final studentNo;
  final teacherName;
  final teacherNo;
  final id;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final dbAddBatches = FirebaseDatabase.instance.ref('AddBatch');

  TextEditingController batchNoController = TextEditingController();
  TextEditingController noOfStudentController = TextEditingController();
  TextEditingController leaderNameController = TextEditingController();
  TextEditingController lederMobilController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    batchNoController.text = widget.batchName.toString();
    noOfStudentController.text = widget.studentNo.toString();
    leaderNameController.text = widget.teacherName.toString();
    lederMobilController.text = widget.teacherNo.toString();
    locationController.text = widget.locations.toString();

    return ChangeNotifierProvider(
      create: (context) => EdithScreenProvider(),
      child: Consumer<EdithScreenProvider>(
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
                            'Edit Batch Detals',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            controller: batchNoController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Batch Name',
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
                            controller: locationController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Location',
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
                            controller: noOfStudentController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter No of Student',
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
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Batch Lead Detail',
                              style: TextStyle(
                                  color: const Color(0xFF5AB7B7),
                                  fontSize: 20.sp),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            controller: leaderNameController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Batch Leader',
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
                            controller: lederMobilController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Enter Leader Number',
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
                              dbAddBatches.child(widget. id).update({
                                'batch_no': batchNoController.text,
                              }).then((v) {
                                ToastPopup().toast('Sign Out Successfully',
                                    Colors.green, Colors.white);
                              }).onError((error, v) {
                                ToastPopup()
                                    .toast(Error, Colors.red, Colors.white);
                              });
                            },
                            text: 'Save',
                          ),
                        ],
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
