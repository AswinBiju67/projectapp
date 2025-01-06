import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/movieticketbook/selectdate.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Moviedetails extends StatefulWidget {
  int? index;
   Moviedetails({super.key,this.index});

  @override
  State<Moviedetails> createState() => _MoviedetailsState();
}

class _MoviedetailsState extends State<Moviedetails> {
  
  late YoutubePlayerController _yotube;
  @override
  void initState() {
   final videoid= YoutubePlayer.convertUrlToId(Dummydb().movielink[widget.index!]);
   _yotube=YoutubePlayerController(initialVideoId: videoid!,
   flags: const YoutubePlayerFlags(
    autoPlay: true,
    mute: true
   ));
    super.initState();
  }

  @override
  void dispose() {
    _yotube.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(Dummydb().movieName[widget.index!]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: YoutubePlayer(
                      controller: _yotube,
                      showVideoProgressIndicator: true,
                      ),
                  ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade300
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("2D"),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Malayalam"),
                ),
              ),
                ],
              ),
              SizedBox(height: 10,),
              Text(Dummydb().moviedetails[widget.index!],style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              Text("About The Movie",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 20),),
              SizedBox(height: 10,),
              Text(Dummydb().moviedes[widget.index!]),
              SizedBox(height: 30,),
              
            ],),
            InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Selectdate(index: widget.index,),));
              },
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text("Book Now",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 20),)),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}