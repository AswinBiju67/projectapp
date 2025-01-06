import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profilecontroller with ChangeNotifier{

  final CollectionReference itemcollection= 
  FirebaseFirestore.instance.collection('userdetails');

  
}