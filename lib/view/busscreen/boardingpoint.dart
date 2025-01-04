import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoardingPoint extends StatelessWidget {
  const BoardingPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Boarding point in Thodupuzha"),
                Divider(color: Colors.grey.shade300,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("17: 30  Thodupuzha",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),),
                    Radio(value: "v", groupValue: "v", onChanged: (value) => value,activeColor: Colors.blue,)
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}