import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/musicshow/selectticketmusic.dart';

class Selectshowmusic extends StatelessWidget {
  const Selectshowmusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Music Show",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),),
              Text("2 Events",style: GoogleFonts.montserrat(fontSize: 15),),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(Dummydb().music.length, (index) => 
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Selectticketmusic(index: index,),));
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
                            fit: BoxFit.fill,
                            Dummydb().music[index]),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          height: 30,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade400
                          ),
                          child: Center(child: Text("${Dummydb().musicdate[index]} ")),
                        ),
                        SizedBox(height: 5,),
                        Text(Dummydb().musicshow[index],style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600
                        ),),
                         SizedBox(height: 5,),
                        Text("Concerts",style: GoogleFonts.montserrat(
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