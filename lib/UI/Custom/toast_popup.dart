import 'package:fluttertoast/fluttertoast.dart';

class ToastPopup {

  void toast(message,backgroundColor,textColor){
    Fluttertoast.showToast(
    msg:message,
    backgroundColor: backgroundColor,
    textColor: textColor,
    timeInSecForIosWeb: 4,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    );
  }




}