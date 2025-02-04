import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreenProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool isloading =false;

  void signUp() async {
    isloading = true;
    notifyListeners();
    auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((v) {
      ToastPopup()
          .toast('Account Created Sucessfully', Colors.green, Colors.white);
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
