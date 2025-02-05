import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isloading = false;

  void isLogin() {
    isloading = true;
    notifyListeners();

    auth
        .signInWithEmailAndPassword(
            email: email.text.toString(), password: password.text.toString())
        .then((v) {
      ToastPopup().toast('Sing In Successfully', Colors.green, Colors.white);
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
