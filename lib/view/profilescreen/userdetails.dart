import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Userdetails extends StatelessWidget {
  const Userdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Account-Avatar-Profile-PNG-Photo.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 20,),
            Text("User Information",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.circular(10),
                border: Border.all()
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("User@66gmail.com",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.bold)),
                  )),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.circular(10),
                border: Border.all()
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("User",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.bold)),
                  )),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(child: Text("Edit",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}