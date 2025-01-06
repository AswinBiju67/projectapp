import 'package:flutter/material.dart';

class Selectdatecontroller with ChangeNotifier{
  int selectedindex=0;
  int selectedate=0;
  int? showticket;
  int? sportstickets;


  selectdate(int date){
    selectedindex=date;
    notifyListeners();
  }

  selectdatetrain(int date){
    selectedate=date;
    notifyListeners();
  }

  selectshowticket(int tiket){
    showticket=tiket;
    notifyListeners();
  }

  sportsticket(int sports){
    sportstickets=sports;
    notifyListeners();
  }
  // dynamic picked;
  // TextEditingController datecontroller = TextEditingController();

  // Future<void> datepick(BuildContext context) async {
  //   picked =
  //     await showDatePicker(
  //      context: context,
  //      initialDate: DateTime.now(),
  //      firstDate: DateTime(2025),
  //      lastDate: DateTime(2050),
  //      );
  //       if (picked != null) {
  //       datecontroller.text= picked
  //        .toString()
  //        .split(' ')[0];
  //         }
  //         notifyListeners();
  // }
}