import 'package:attendanceapp/UI/Custom/button.dart';
import 'package:attendanceapp/UI/Custom/custom_text_form_field.dart';
import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:attendanceapp/UI/Home/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<dynamic> BottomSheetWidget(
    BuildContext context, HomeScreenProvider model) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 500.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Enter Batch Details',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: CustomTextFormField(
                hitText: 'Enter Course Name',
                keyBoradType: TextInputType.name,
                obsText: false,
                controller: model.cousreName,
                vlaidationText: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Course Name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: CustomTextFormField(
                hitText: 'Enter Batch Number',
                keyBoradType: TextInputType.text,
                obsText: false,
                controller: model.batchNumber,
                vlaidationText: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Batch Number';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Button(
              onPressed: () {
                model.isLoading = true;
                Get.back();
                String id = DateTime.now().microsecondsSinceEpoch.toString();

                model.dbAddBatches.child(id).set({
                  'courseName': model.cousreName.toString().trim(),
                  'batchNumber': model.batchNumber.toString().trim(),
                }).then((v) {
                  ToastPopup().toast('Data Added', Colors.green, Colors.white);
                  model.cousreName.clear();
                  model.batchNumber.clear();
                }).onError((Eror, v) {
                  ToastPopup().toast(Error, Colors.red, Colors.white);
                });
              },
              text: 'Add Batch Number',
            ),
          ],
        ),
      );
    },
  );
}
