import 'package:attendanceapp/UI/BatchDetails/batch_details.dart';
import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBatchesProvider extends ChangeNotifier {
  List<String> location = ['Chrsadda', 'Naguman', 'Peshawar', 'Mardan'];

  bool isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  final dbBatch = FirebaseDatabase.instance.ref('Batch Details');

  TextEditingController batchNoController = TextEditingController();
  TextEditingController noOfStudentController = TextEditingController();
  TextEditingController leaderNameController = TextEditingController();
  TextEditingController lederMobilController = TextEditingController();

  void saveData() {
    String id = DateTime.now().microsecondsSinceEpoch.toString();

    isLoading = true;

    dbBatch.child(id).set({
      'id': id,
      // 'userId': auth.currentUser.uid,
      'location': location.first.toString(),
      'batchNo': batchNoController.text.toString().trim(),
      'noOfStudent': noOfStudentController.text.toString().trim(),
      'leaderName':
          leaderNameController.text.toString().trim().toString().trim(),
      'leaderMobil': lederMobilController.text,
    }).then((v) {
      ToastPopup().toast('Data Save Successfully', Colors.green, Colors.white);
      isLoading = false;
      notifyListeners();
      batchNoController.clear();
      noOfStudentController.clear();
      leaderNameController.clear();
      lederMobilController.clear();
      Get.to(const BatchDetails());
      location.clear();
    }).onError((Error, v) {
      ToastPopup().toast(Error.toString(), Colors.red, Colors.white);
      isLoading = false;
      notifyListeners();
    });
  }
}
