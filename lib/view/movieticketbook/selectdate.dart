import 'package:date_picker_timeline/date_picker_timeline.dart';
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
   DateTime selectdate=DateTime.now();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(Dummydb().movieName[widget.index!]),
      ),
      body: Column(
        children: [
          DatePicker(
            DateTime.now(),
            height: 100,
            width: 80,
            initialSelectedDate: DateTime.now(),
            selectedTextColor: Colors.white,
            selectionColor: Colors.blue,
            dateTextStyle: GoogleFonts.montserrat(),
            dayTextStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey
              ),
            ),
            monthTextStyle: GoogleFonts.montserrat(),
            onDateChange: (selectedDate) {
              selectdate=selectedDate;
            },
          ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Seatselections(index: widget.index!,date: selectdate.toString(),)));
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