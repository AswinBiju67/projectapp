import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/view/busscreen/busseat.dart';

class SearchbusScreen extends StatefulWidget {
  String? date;
  String? from;
  String? to;
  
   SearchbusScreen({super.key,this.date,this.from,this.to});

  @override
  State<SearchbusScreen> createState() => _SearchbusScreenState();
}

class _SearchbusScreenState extends State<SearchbusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(widget.from!,style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
                   Icon(Icons.arrow_right),
              Text(widget.to!,style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Text("3 Buses")
          ],
        ),
        SizedBox(width: 70,),
       Padding(
         padding: const EdgeInsets.only(top: 10,right: 10),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(child: Text(widget.date!,style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,),)),
             
           ],
         ),
       )
      ],backgroundColor: Colors.white,),
      body: Column(
        children: [
          Column(
            children: List.generate(
              3,
              (index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseSeat(
                          date: widget.date,
                          from: widget.from,
                          to: widget.to,
                        ),));
                      },
                      child: Container(
                        
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("23:05 - 11:15"),
                                      Text("12h 10m - 30 Seats")
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("₹788"),
                                      Text("Onwards"),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("KSRTC (Kerala) - 109",style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text("Swift Deluxe Non Ac Air Bus (2+2)")
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey.shade300
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Colors.green.shade700
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Row(
                                                children: [
                                                Icon(Icons.star_outline,color: Colors.white,),
                                                Text("4.5",style: TextStyle(color: Colors.white),)
                                              ],),
                                            ),
                                          ),
                                        ),
                                        Text("04")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
            ),
          ),
        ],
      ),
    );
  }
}
