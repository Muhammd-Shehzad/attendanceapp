import 'package:attendanceapp/UI/Custom/toast_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool showMenu = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  void isLouout() {
    isLoading = true;
    notifyListeners();

    auth.signOut().then((v) {
      ToastPopup().toast('Sign Out Successfully', Colors.green, Colors.white);
      isLoading = false;
      notifyListeners();
    }).onError((Eror, v) {
      ToastPopup().toast(Error, Colors.red, Colors.white);
      isLoading = false;
      notifyListeners();
    });
  }
}
