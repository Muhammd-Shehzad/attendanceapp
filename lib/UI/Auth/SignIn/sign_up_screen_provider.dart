import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:attendanceapp/UI/Home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference db = FirebaseDatabase.instance.ref('user');
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isloading = false;

  void signUp() async {
    isloading = true;
    notifyListeners();

    auth.createUserWithEmailAndPassword(
        email: email.text.toString(), password: password.text.toString());

    String id = DateTime.now().microsecondsSinceEpoch.toString();

    db.child(id).set({
      'email': email.text.toString(),
      'id': id.toString(),
    }).then((v) {
      ToastPopup()
          .toast('Account Created Sucessfully', Colors.green, Colors.white);
      Get.off(HomeScreen());

      email.clear();
      password.clear();
      isloading = false;
      notifyListeners();
    }).onError((Error, v) {
      ToastPopup().toast(Error.toString(), Colors.red, Colors.white);
      isloading = false;
      notifyListeners();
    });
  }
}
