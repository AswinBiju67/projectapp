
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Movieorderscontroller with ChangeNotifier{
  final CollectionReference itemcollectionmovie= 
  FirebaseFirestore.instance.collection('movieticket');

  void additem({required String tittle,required String ceniplex,required String image,required String time,required String date }){
  itemcollectionmovie.add(
    {'movietittle':tittle,
    'ceniplex':ceniplex,
    'image':image,
    'time':time,
    'date':date,
    }
  );
 }
}