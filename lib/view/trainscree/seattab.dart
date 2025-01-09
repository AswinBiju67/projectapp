import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/controller/selectcontroller.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/trainscree/selectseat.dart';
import 'package:provider/provider.dart';

class Seattab extends StatefulWidget {
  final String? date;
  final String? from;
  final String? to;
  const Seattab({super.key,this.date,this.from,this.to});

  @override
  State<Seattab> createState() => _SeattabState();
}

class _SeattabState extends State<Seattab> {
  
  @override
  Widget build(BuildContext context) {
    final selectdate=context.watch<Selectdatecontroller>().selectedate;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.from!} to ${widget.to!}",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 17),),
          Text("${widget.date!} : 2 trains",style: GoogleFonts.montserrat(fontSize: 17),),
          
        ],
      ),),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Container(
                    color: Colors.grey.shade300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("NOV",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 15),)
                    ),
                  ),
                  Row(children: List.generate(6, (index) =>  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      onTap: () {
                        context.read<Selectdatecontroller>().selectdatetrain(index);
                      },
                      child: Container(
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: selectdate == index ? Colors.blue : Colors.white,
                          border: Border.all(color: Colors.grey.shade500)
                         ),
                         child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(Dummydb().date[index],style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 15,
                          color: selectdate == index ? Colors.white : Colors.black, ),)
                        ),
                      ),
                    ),
                  ),),)
                ],
              ),
            ),
          ),
       
         
               SizedBox(height: 30,),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("22226 Csmt Vandebharat"),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("09:20 AM",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 17),),
                            Text("${widget.from!}")
                          ],
                        ),
                        Text("03h 15m"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("12:35 PM",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 17),),
                            Text("${widget.to!}")
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Csaet(),));
                        },
                        child: Container(
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.shade200,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text("CC",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.brown),),
                                  Text("715",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.brown),),
                                                      
                                ],),
                                Container(
                                  height: 40,
                                 
                                  decoration: BoxDecoration(
                                  color: Colors.amber.shade100,
                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
                                ),
                                child: Center(child: Text("TQWL 11")),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),),)
                  ],
                ),
              )),
              SizedBox(height: 10,),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("122220 Ltt Duronto"),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("07:55 AM",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 17),),
                            Text("${widget.from!}")
                          ],
                        ),
                        Text("03h 20m"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("11:15 PM",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 17),),
                            Text("${widget.to!}")
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Csaet(),));
                        },
                        child: Container(
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade200,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text("3A",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.brown),),
                                  Text("715",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.brown),),
                                                      
                                ],),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                  color: Colors.green.shade100,
                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
                                ),
                                child: Center(child: Text("Available 22")),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),),)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}