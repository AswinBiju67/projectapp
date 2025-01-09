import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/controller/amusementcontroller.dart';
import 'package:projectapp/controller/eventcontroller.dart';
import 'package:projectapp/controller/movieorderscontroller.dart';
import 'package:projectapp/controller/ticketcontroller.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final movie=context.watch<Movieorderscontroller>();
    final park=context.watch<Amusementcontroller>();
    final event=context.watch<Eventcontroller>();
    final ticket=context.watch<Ticketcontroller>();


    return Scaffold(
      appBar: AppBar(title: Text("History"),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Movie Tickets",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 10,),
            StreamBuilder(
              stream: movie.itemcollectionmovie.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return  Column(children: List.generate(snapshot.data!.docs.length, (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          height: 100,
                          fit: BoxFit.fill,
                          snapshot.data!.docs[index]["image"])),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Movie :${snapshot.data!.docs[index]["movietittle"]}"),
                            Text("Theater :${snapshot.data!.docs[index]["ceniplex"]}"),
                            Text("Time :${snapshot.data!.docs[index]["time"]}"),
                            Text("Date :${snapshot.data!.docs[index]["date"]}"),
                          ],)
                    ],
                  ),
                ),
              ),
            ),),
            );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: Text('No data found'),
                  );
                }
              },
            ),
            SizedBox(height: 10,),
            Text("Amusement Park Tickets",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 10,),
           StreamBuilder(
              stream: park.itemcollectionpark.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return  Column(children: List.generate(snapshot.data!.docs.length, (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          height: 80,
                          fit: BoxFit.fill,
                          snapshot.data!.docs[index]["image"])),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Park Name :${snapshot.data!.docs[index]["tittle"]}"),
                            Text("Persons :${snapshot.data!.docs[index]["person"]}"),
                            Text("Price :${snapshot.data!.docs[index]["price"]}"),
                            Text("Date :${snapshot.data!.docs[index]["date"]}"),
                          ],)
                    ],
                  ),
                ),
              ),
            ),));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: Text('No data found'),
                  );
                }
              },
            ),
            SizedBox(height: 10,),
            Text("Event Tickets",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 10,),
            StreamBuilder(
              stream: event.itemcollectionevent.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return Column(children: List.generate(snapshot.data!.docs.length, (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${snapshot.data!.docs[index]["event"]}",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              height: 100,
                              width: 60,
                              fit: BoxFit.fill,
                              snapshot.data!.docs[index]["image"])),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text("Show Name :${snapshot.data!.docs[index]["tittle"]}"),
                                Text("Persons :${snapshot.data!.docs[index]["person"]}"),
                                Text("Seat Type :${snapshot.data!.docs[index]["type"]}"),
                                Text("Price :${snapshot.data!.docs[index]["price"]}"),
                                Text("Date :${snapshot.data!.docs[index]["date"]}"),
                              ],)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),),
            );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: Text('No data found'),
                  );
                }
              },
            ),
            SizedBox(height: 10,),
            Text("Travel Tickets",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 10,),
            StreamBuilder(
              stream: ticket.itemcollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return Column(children: List.generate(snapshot.data!.docs.length, (index) => 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()
                        
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("${snapshot.data!.docs[index]["vech"]}",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20),),
                          Text("Date :${snapshot.data!.docs[index]["date"]}"),
                          Text("Bus :${snapshot.data!.docs[index]["vechtype"]}"),
                          Row(
                            children: [
                              Text("Location : ${snapshot.data!.docs[index]["from"]}"),
                              SizedBox(width: 5,),
                              Text("To"),
                              SizedBox(width: 5,),
                              Text("${snapshot.data!.docs[index]["to"]}"),
                            ],
                          ),
                          Text("Price :${snapshot.data!.docs[index]["price"]}"),
                          Text("Passengers :${snapshot.data!.docs[index]["passengers"]}"),
                        ],),
                      ),
                    ),
                  ),),);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: Text('No data found'),
                  );
                }
              },
            ),
          ],),
        ),
      ),
    );
  }
}