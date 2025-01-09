import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Userdetails extends StatefulWidget {
  const Userdetails({super.key});

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  String? userEmail;
  final TextEditingController fieldOneController = TextEditingController();
  @override
  void initState() {
    final User? user = FirebaseAuth.instance.currentUser;
    userEmail = user?.email;
    super.initState();
  }

  
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
                    child: Text(userEmail!,style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.bold)),
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
                    child: Text("735653XXXX",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.bold)),
                  )),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                  InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(child: Text("Logout",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}