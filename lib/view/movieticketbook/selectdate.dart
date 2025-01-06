import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/controller/selectcontroller.dart';
import 'package:projectapp/dummydb.dart';

import 'package:projectapp/view/movieticketbook/selectseat.dart';
import 'package:provider/provider.dart';


class Selectdate extends StatefulWidget {
  int? index;
   Selectdate({super.key,this.index});

  @override
  State<Selectdate> createState() => _SelectdateState();
}

class _SelectdateState extends State<Selectdate> {
   
  @override
  Widget build(BuildContext context) {
    List  date=["MON","TUE","WED","THU","FRI"];
   final selectdate= context.watch<Selectdatecontroller>().selectedindex;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(Dummydb().movieName[widget.index!]),
      ),
      body: Column(
        children: [
          Row(children: List.generate(5, (index) => InkWell(
            onTap: () {
             context.read<Selectdatecontroller>().selectdate(index);
             
            },
            child: Container(
              height: 100,
              width: 60,
              color: selectdate == index ? Colors.blue : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(date[index],style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,
                    color: selectdate == index ? Colors.white : Colors.black,),),
                    Text(index == 0 ? "${2}" :"${2+index}",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,
                    color: selectdate == index? Colors.white : Colors.black,),),
                    Text("Jan",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,
                    color: selectdate == index ? Colors.white : Colors.black,),),
                  ],
                ),
              ),
            ),
          ),),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite_outline),
                        SizedBox(width: 10,),
                        Text("Aashirvad Cineplex",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("Non Cancelable",style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Seatselections(index: widget.index!,)));
                      },
                      child: Row(children: List.generate(3, (index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:Border.all(color: Colors.grey)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                               children: [
                                Text(Dummydb().time[index],style: GoogleFonts.montserrat(color: Colors.green,fontWeight: FontWeight.bold),),
                              Text("4K DOLBY ATMOS",style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 8),),
                               ],
                            ),
                          ),
                        ),
                      ),),)
                    )
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}