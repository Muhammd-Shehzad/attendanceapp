import 'package:attendanceapp/UI/BatchDetails/batch_details.dart';
import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBatchesProvider extends ChangeNotifier {
  List<String> locations = ['Chrsadda', 'Naguman', 'Peshawar', 'Mardan'];
  bool isOpen = false;
  String selectOption = 'Enter Location';
  

  bool isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  final dbBatch = FirebaseDatabase.instance.ref('Batch Details');

  TextEditingController batchNoController = TextEditingController();
  TextEditingController noOfStudentController = TextEditingController();
  TextEditingController leaderNameController = TextEditingController();
  TextEditingController lederMobilController = TextEditingController();

  final dbAddBatches = FirebaseDatabase.instance.ref('AddBatch');
    

  

  void addBatcheDetails() {
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    dbAddBatches.child(id).set({
      'batch_no': batchNoController.text.trim(),
      'no_of_students': noOfStudentController.text.trim(),
      'leader_name': leaderNameController.text.trim(),
      'leader_mobil': lederMobilController.text.trim(),
      'locations': selectOption.toString()
    }).then((v) {
      ToastPopup().toast('Data Added', Colors.green, Colors.white);
      batchNoController.clear();
      noOfStudentController.clear();
      leaderNameController.clear();
      lederMobilController.clear();
      notifyListeners();
      Get.back();
    }).onError((Eror, v) {
      ToastPopup().toast(Error, Colors.red, Colors.white);
    });
  }
}
