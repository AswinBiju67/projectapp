import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/view/homescreen/homescreen.dart';

class Csaet extends StatelessWidget {
  const Csaet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "22226 Csmt Vandebharat",
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.brown.shade300, width: 2),
                          color: Colors.amber.shade100),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "AC Chair Car (CC)",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              "TQWL 10",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "07:55 AM",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text("Pune Jn(PUNE)")
                            ],
                          ),
                          Text("03h 20m"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "11:15 PM",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text("Lokmanyatilak (LTT)")
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Boaeding Station"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Pune Jn (Pune)",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Boaeding time: Sat,23 Nov.09:20 AM"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.shade100),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "You searched for trains From PUNE to MMCT,but you arer booking this train from PUNE to CSMT",
                          style: GoogleFonts.montserrat(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "IRCTC User name",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        "Done",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Aswin",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Icon(
                                Icons.circle,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "IRCTC password is required to complete the booking.if you nees a new password, required for a new one new",
                        style: GoogleFonts.montserrat(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Forgot password",
                        style: GoogleFonts.montserrat(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Create a new IRCTC account",
                        style: GoogleFonts.montserrat(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "Passengers",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("At least one adult required"),
                          Text("0 of 4")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueAccent.shade700),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_add_alt_1_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Add Passenger",
                                style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 25,
            ),
            Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Details",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        "Required",
                        style: GoogleFonts.montserrat(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Booking details will be sent to the Contact information proviede below",
                        style: GoogleFonts.montserrat(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.montserrat(),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "aswin@gamil.com",
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "MObile number",
                        style: GoogleFonts.montserrat(),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "735653XXXX",
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 15,
            ),
           
            SizedBox(height: 10,),
           
            SizedBox(height: 10,),
             Center(child: Text("By continuing, I accept",style: GoogleFonts.montserrat(fontSize: 17),)),
             SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Text("Terms & conditions",style: GoogleFonts.montserrat(color: Colors.blue.shade700,decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: 17),),
                 Text("Privacy policy",style: GoogleFonts.montserrat(color: Colors.blue.shade700,decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: 17),),
               ],
             ),
             SizedBox(height: 15,),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 85,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide())
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("₹ 145",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 21),),
                 Text("per passenger (excl.tax)",style: GoogleFonts.montserrat(),),
              ],),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Homescreen(),),(route) => false,);
                },
                child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Continue",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold),),
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
