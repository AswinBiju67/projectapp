
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Eventcontroller with ChangeNotifier{
  final CollectionReference itemcollectionevent= 
  FirebaseFirestore.instance.collection('eventticket');

  void additem({required String event,required String tittle,required int person,required String image,required int price,required String date,required String type }){
  itemcollectionevent.add(
    {'event':event,
    'tittle':tittle,
    'person':person,
    'image':image,
    'price':price,
    'date':date,
    'type':type
    }
  );
 }
}