import 'package:flutter/material.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/model/constants.dart';
import 'package:projectapp/widgets/seatselecting.dart';

class Seatselections extends StatefulWidget {
  int? index;
   Seatselections({super.key,this.index});

  @override
  State<Seatselections> createState() => _SeatselectionsState();
}

class _SeatselectionsState extends State<Seatselections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(Dummydb().movieName[widget.index!], style: TextStyle(color: darkColor, fontSize: textContent, fontFamily: primaryFont),),
              Text('Aashirvad Ceniplex', style: TextStyle(color: darkColor, fontSize: 12, fontFamily: subtitleFonts),),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SeatsListings(index: widget.index,),
    );
  }
}