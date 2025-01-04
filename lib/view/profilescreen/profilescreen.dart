import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi User!',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(children: [
                Icon(Icons.person),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("View Your Profile",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("Edit Your Profile",style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),),
                ],
              ),
              ],),
              
             Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
           Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(children: [
                Icon(Icons.shopping_bag),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your Orders",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("View All your bookings",style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),),
                ],
              ),
              ],),
              
             Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(height: 10,),
          Divider()
        ],),
      ),
    );
  }
}