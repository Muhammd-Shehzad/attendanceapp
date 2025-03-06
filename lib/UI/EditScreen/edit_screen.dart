import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:attendanceapp/UI/EditScreen/edith_screen_provider.dart';
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
  TextEditingController batchNameController = TextEditingController();
  TextEditingController noOfStudentController = TextEditingController();
  TextEditingController leaderNameController = TextEditingController();
  TextEditingController lederMobilController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> locations = ['Chrsadda', 'Naguman', 'Peshawar', 'Mardan'];
    bool isOpen = false;
    String selectOption = 'Enter Location';
    batchNameController.text = widget.batchName.toString();
    noOfStudentController.text = widget.studentNo.toString();
    leaderNameController.text = widget.teacherName.toString();
    lederMobilController.text = widget.teacherNo.toString();
    selectOption = widget.locations.toString();

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
                            controller: batchNameController,
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
                                                  : 'Enter Location',
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
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      width: 319.w,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: ListView(
                                        primary: false,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        children: locations
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
                                                      horizontal: 20.w),
                                                  alignment:
                                                      Alignment.centerLeft,
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
                                  ),
                              ],
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
                              print('helloword');
                              model.dbAddBatches.child(widget.id).update({
                                'batch_no': batchNameController.text.trim(),
                                'locations': selectOption.toString(),
                                'no_of_students':
                                    noOfStudentController.text.trim(),
                                'leader_name': leaderNameController.text.trim(),
                                'leader_mobil':
                                    lederMobilController.text.trim(),
                              }).then((v) {
                                ToastPopup().toast(
                                    'Data Updated', Colors.green, Colors.white);
                                batchNameController.clear();
                                selectOption = '';
                                noOfStudentController.clear();
                                leaderNameController.clear();
                                lederMobilController.clear();
                              }).onError((Eror, v) {
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
