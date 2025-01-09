
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Amusementcontroller with ChangeNotifier{
  
  final CollectionReference itemcollectionpark= 
  FirebaseFirestore.instance.collection('patkticket');

  void additem({required String tittle,required String person,required String image,required int price,required String date }){
  itemcollectionpark.add(
    {'tittle':tittle,
    'person':person,
    'image':image,
    'price':price,
    'date':date,
    }
  );
 }
 

}