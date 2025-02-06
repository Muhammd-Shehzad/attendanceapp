import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:attendanceapp/UI/Home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isloading = false;

  void isLogin() {
    isloading = true;
    notifyListeners();

    auth
        .signInWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim())
        .then((v) {
      ToastPopup().toast('Sign In Successfully', Colors.green, Colors.white);
      Get.off(HomeScreen());
      isloading = false;
      email.clear();
      password.clear();
      notifyListeners();
    }).onError((error, stackTrace) {
      ToastPopup().toast(error.toString(), Colors.red, Colors.white);
      isloading = false;
      notifyListeners();
    });
  }
}
