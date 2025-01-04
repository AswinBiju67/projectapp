import 'package:flutter/material.dart';

class Selectdatecontroller with ChangeNotifier{
  int selectedindex=0;
  int selectedate=0;
  selectdate(int date){
    selectedindex=date;
    notifyListeners();
  }

  selectdatetrain(int date){
    selectedate=date;
    notifyListeners();
  }
}