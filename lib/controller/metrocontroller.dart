import 'package:flutter/material.dart';

class Metrocontroller with ChangeNotifier{
  int count=1;
  onincrement(){
    if(count<10){
      count++;
    notifyListeners();
    }
    
  }

  ondecrement(){
    if(count>1){
      count--;
    notifyListeners();
    }
    
  }
}