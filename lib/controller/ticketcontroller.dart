
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Ticketcontroller with ChangeNotifier{
 int? parkrate;
 int? parkperson;
 String? parkdate;

 park(int rate,int person,String date){
  parkrate=rate;
  parkperson=person;
  parkdate=date;
 }

 int? showrate;
 int? seat;
 comedyshow(int rate,int index){
  showrate=rate;
  seat=index;
 }

 int? kids;
 int? kidscount;

 kidsshow(int rate,int kids){
kids=rate;
kidscount=kids;
 }

 int? ratesp;
 int? person;
 sports(int rate,int count){
  ratesp=rate;
  person=count;
 }

 int? metrorate;
 metro(int raet){
  metrorate=raet;
 }

final CollectionReference itemcollection= 
  FirebaseFirestore.instance.collection('tickets');

  void additem({required String vech,required String vechtype,required String from,required String to,required int price,required String date,required int pass }){
  itemcollection.add(
    {'vech':vech,
    'vechtype':vechtype,
    'from':from,
    'to':to,
    'price':price,
    'date':date,
    'passengers':pass
    }
  );
 }

 
}