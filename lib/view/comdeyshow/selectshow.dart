import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/comdeyshow/bookshow.dart';

class Selectshow extends StatelessWidget {
  const Selectshow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Comdey Show",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),),
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
            children: List.generate(Dummydb().comdey.length, (index) => 
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Bookshow(index: index,),));
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
                            Dummydb().comdey[index]),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          height: 30,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade400
                          ),
                          child: Center(child: Text("${Dummydb().comdeydate[index]} onwards")),
                        ),
                        SizedBox(height: 5,),
                        Text(Dummydb().comdeyname[index],style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600
                        ),),
                         SizedBox(height: 5,),
                        Text("Stand up Comdey",style: GoogleFonts.montserrat(
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