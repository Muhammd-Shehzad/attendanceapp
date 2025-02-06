import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddBatchesProvider extends ChangeNotifier {
  List<String> location = ['Chrsadda', 'Naguman', 'Peshawar', 'Mardan'];

  FirebaseAuth auth = FirebaseAuth.instance;

  void saveData(){

    if(location.isEmpty) {
      throw Exception('Location field is required');
    }





 




  }

  
}
