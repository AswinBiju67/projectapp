import 'package:flutter/material.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/model/constants.dart';
import 'package:projectapp/view/homescreen/homescreen.dart';

import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class ShowTicket extends StatefulWidget {
  int? index;
   ShowTicket({super.key,this.index});

  @override
  State<ShowTicket> createState() => _ShowTicketState();
}

class _ShowTicketState extends State<ShowTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.92),
      body: Center(
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width - 80,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              CustomPaint(
                painter: SideCutsDesign(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                ),
              ),
              Positioned(
                  left: 20,
                  top: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          Dummydb().movie[widget.index!],
                          height: 100,
                          width: 80,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Dummydb().movieName[widget.index!],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: primaryFont),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Malayalam',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: subtitleFonts),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Wed 20 Nov | 06:30 PM',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: subtitleFonts),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Aashirvad Ceniplex',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: subtitleFonts),
                          ),
                        ],
                      )
                    ],
                  )),
              CustomPaint(
                painter: Dottedline(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: SfBarcodeGenerator(
                          value: "bookit.com",
                        symbology: QRCode(

                        ),

                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Screen 2',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: primaryFont),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'A-10,11',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: subtitleFonts),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '2 Tickets',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: subtitleFonts),
                        ),

                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>Homescreen()));
          },
          child: Container(
            height: 48,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width-40,
            decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              'Go to Home',
              style: TextStyle(
                color: Colors.white,
                fontFamily: primaryFont,
                fontSize: 16
              ),
            ),
          ),
        ),
      )
    );
  }
}

class Dottedline extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 3;
    double dashSpace = 4;
    double startX = 20;
    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = 1;

    while (startX < size.width - 18) {
      canvas.drawCircle(Offset(startX, 144), 2, paint);
      startX += dashWidth + dashSpace;
    }
  }

  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SideCutsDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(0, h / 1.5), radius: 18),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = const Color.fromARGB(235, 235, 235, 235));
    canvas.drawArc(
        Rect.fromCircle(center: Offset(w, h / 1.5), radius: 18),
        0,
        10,
        false,
        Paint()
          ..style = PaintingStyle.fill
          ..color = const Color.fromARGB(235, 235, 235, 235));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}