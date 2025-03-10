import 'package:attendanceapp/UI/AddBatches/add_batches_provider.dart';
import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/Custom/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddBatches extends StatefulWidget {
  const AddBatches({super.key});

  @override
  State<AddBatches> createState() => _AddBatchesState();
}

class _AddBatchesState extends State<AddBatches> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddBatchesProvider(),
      child: Consumer<AddBatchesProvider>(
        builder: (context, model, child) => Scaffold(
          body: Form(
            key: model.formKey,
            child: Column(
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
                              'Enter Batch Details',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormField(
                              hitText: 'Enter Batch No',
                              keyBoradType: TextInputType.emailAddress,
                              obsText: false,
                              controller: model.batchNoController,
                              vlaidationText: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Batch No';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormField(
                              hitText: 'Enter Location',
                              keyBoradType: TextInputType.text,
                              obsText: false,
                              controller: model.locationController,
                              vlaidationText: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Batch No';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormField(
                              hitText: 'Enter No of Students',
                              keyBoradType: TextInputType.emailAddress,
                              obsText: false,
                              controller: model.noOfStudentController,
                              vlaidationText: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter No of Students';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Batch Lead Details',
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormField(
                              hitText: 'Enter Batch Leader Name',
                              keyBoradType: TextInputType.name,
                              obsText: false,
                              controller: model.leaderNameController,
                              vlaidationText: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Leader Name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormField(
                              hitText: 'Enter Batch Leader Mobil',
                              keyBoradType: TextInputType.phone,
                              obsText: false,
                              controller: model.lederMobilController,
                              vlaidationText: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Batch Leader Mobile Number';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Button(
                              onPressed: () {
                                if (model.formKey.currentState!.validate()) {
                                  model.addBatcheDetails();
                                  print('helloooooo');
                                }
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
      ),
    );
  }
}
