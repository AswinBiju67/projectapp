import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/view/busscreen/boardingpoint.dart';
import 'package:projectapp/view/busscreen/dropponit.dart';

class BoardingScreen extends StatefulWidget {
  String? date;
  String? from;
  String? to;
   BoardingScreen({super.key,this.date,this.from,this.to});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [ Padding(
          padding: const EdgeInsets.only(right: 130,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selected boarding & dropping points"),
              Row(
                children: [
                  Text("Thodupuzha"),
                  Icon(Icons.arrow_right),
              Text("Bengaluru"),
                ],
              ),
              
            ],
          ),
        ),],
        bottom: TabBar(
        indicatorColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        labelStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        labelColor: Colors.black,
        tabs: [
        Tab(text: "Boarding points\n  Thodupuzha",),
        Tab(text: "Dropping points \n Sriranga patna",),
       
       
      ],)
        ),
        body: TabBarView(
        children: [
     BoardingPoint(),
      DroppingPoint()

      

      ]),
      ),
    );
  }
}