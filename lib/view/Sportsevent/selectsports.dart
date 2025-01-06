import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/Sportsevent/sportsdetailscreen.dart';
import 'package:projectapp/view/musicshow/selectticketmusic.dart';

class Selectsports extends StatelessWidget {
  const Selectsports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sport Event",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),),
              Text("1 Events",style: GoogleFonts.montserrat(fontSize: 15),),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(Dummydb().sports.length, (index) => 
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Sportsdetailscreen(index: index,),));
                },
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            height: 250,
                            width: 200,
                            fit: BoxFit.fill,
                            Dummydb().sports[index]),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          height: 30,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade400
                          ),
                          child: Center(child: Text("${Dummydb().sportdate[index]} ")),
                        ),
                        SizedBox(height: 5,),
                        Text(Dummydb().sportsname[index],style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600
                        ),),
                         SizedBox(height: 5,),
                        Text("Football",style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
            ),),
          ),
        ),
      ),
    );
  }
}