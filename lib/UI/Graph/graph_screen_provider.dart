import 'package:flutter/material.dart';

class GraphScreenProvider extends ChangeNotifier {

Map<String, double> batchData = { 
    "Attendance": 50, 
    "Absent": 10, 
   
  }; 
   List<Color> colorList = [ 
    const Color(0xff3EE094), 
    const Color(0xffFA4A42), 
  ]; 

}