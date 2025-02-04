import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isloading = false;

  void isLogin() {
    isloading = true;
    notifyListeners();

    auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((v) {
      ToastPopup().toast('Sing In Successfully', Colors.green, Colors.white);
      emailController.clear();
      passwordController.clear();
      isloading = false;
      notifyListeners();
    }).onError((Error, v) {
      ToastPopup().toast(Error.toString(), Colors.red, Colors.white);
      isloading = false;
      notifyListeners();
    });
  }
}
