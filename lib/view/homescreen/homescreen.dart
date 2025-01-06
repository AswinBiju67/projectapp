import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/Amusementpark/parkdetails.dart';
import 'package:projectapp/view/Sportsevent/selectsports.dart';
import 'package:projectapp/view/busscreen/searchbus.dart';
import 'package:projectapp/view/comdeyshow/selectshow.dart';
import 'package:projectapp/view/kidsshow/selectkidsshow.dart';
import 'package:projectapp/view/location.dart';
import 'package:projectapp/view/metrocreen/metro%20ticket%20booking.dart';
import 'package:projectapp/view/movieticketbook/moviedetails.dart';
import 'package:projectapp/view/musicshow/Selectshowmusic.dart';
import 'package:projectapp/view/profilescreen/profilescreen.dart';
import 'package:projectapp/view/trainscree/seattab.dart';

class Homescreen extends StatefulWidget {
  String? location;
  Homescreen({super.key, this.location});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController datecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "It All Starts Here!",
              style: GoogleFonts.montserrat(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationAutocomplete(),
                        ));
                  },
                  child: Text(
                    "Kochi",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_right,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.search_outlined,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profilescreen(),
                    ));
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                    "assets/images/Account-Avatar-Profile-PNG-Photo.png"),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Welcome to BookIt',
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown),
                  ),
                  SizedBox(width: 5,),
                  Image.asset(
                    height: 25,
                    "assets/images/logo.png")
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Book Your Movie Tickets",
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              _moviesection(context),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Browse travel tickets by Category",
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                "Book your Tickets",
                style: GoogleFonts.montserrat(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _busticketsection(context),
                    SizedBox(
                      width: 10,
                    ),
                    _trainticketsection(context),
                    SizedBox(
                      width: 10,
                    ),
                    _metroticketsection(context),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Browse Events by Category",
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                "Live events for all entertainment needs",
                style: GoogleFonts.montserrat(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
              _eventsection(context),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amusement Parks",
                    style: GoogleFonts.montserrat(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent),
                  ),
                ],
              ),
              Text(
                "Skip the Queue at the Park, Not the Fun",
                style: GoogleFonts.montserrat(
                    fontSize: 13, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 15,
              ),
              _Amusmentsection(),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _Amusmentsection() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Parkdetails(),
            ));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  "assets/images/wonder.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wonderla Amusement Park Kochi",
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Theme Park",
                    style: GoogleFonts.montserrat(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1064 onwards | zero booking fees",
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Wonderla Amusement Park Kochi",
                    style: GoogleFonts.montserrat(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _eventsection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Selectshow(),
                  ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                  height: 100,
                  width: 150,
                  fit: BoxFit.fill,
                  "assets/images/comedy.png"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Selectkidsshow(),
                  ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                  height: 100,
                  width: 150,
                  fit: BoxFit.fill,
                  "assets/images/kids.png"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Selectshowmusic(),
                  ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                  height: 100,
                  width: 150,
                  fit: BoxFit.fill,
                  "assets/images/music.png"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Selectsports(),
                  ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                  "assets/images/sport-text-banner-poster-design_1308-132744.jpg"),
            ),
          ),
        ),
      ]),
    );
  }

  Column _metroticketsection(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 15),
                      child: Text(
                        "Select Your Metro Station",
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        Dummydb().metroname.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Metrotab(
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: BorderDirectional(
                                      bottom: BorderSide(color: Colors.black))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          height: 35, Dummydb().metro[index]),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        Dummydb().metroname[index],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        size: 45,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
                height: 100,
                width: 150,
                fit: BoxFit.cover,
                "assets/images/maxresdefault.jpg"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Book Your Metro tickets",
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    );
  }

  Column _trainticketsection(BuildContext context) {
    TextEditingController fromplace = TextEditingController();
    TextEditingController toplace = TextEditingController();
    return Column(
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => Padding(
                  padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom ),
                  child: Container(
                        height: 260,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 155,
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 30,
                                          right: 50,
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.black,
                                            child: Icon(
                                              Icons.swap_vert,
                                              color: Colors.white,
                                            ),
                                          )),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border:
                                                Border.all(color: Colors.black)),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    TextField(
                                                      controller: fromplace,
                                                      decoration: InputDecoration(
                                                        hintText: "From",
                                                        hintStyle:
                                                            GoogleFonts.montserrat(
                                                                fontSize: 21),
                                                        prefixIcon: Icon(
                                                            Icons.directions_bus),
                                                      ),
                                                      onChanged: (value) {
                                                        // from=value;
                                                        // setState(() {
                                              
                                                        // });
                                                      },
                                                    ),
                                                    TextField(
                                                        controller: toplace,
                                                        decoration: InputDecoration(
                                                            hintText: "TO",
                                                            hintStyle: GoogleFonts
                                                                .montserrat(
                                                                    fontSize: 21),
                                                            prefixIcon: Icon(Icons
                                                                .directions_bus)),
                                                        onChanged: (value) {
                                                          // to=value;
                                                          // setState(() {
                                              
                                                          // });
                                                        }),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            TextField(
                                              controller: datecontroller,
                                              decoration: InputDecoration(
                                                labelText: "Sselect Date",
                                                prefixIcon: InkWell(
                                                    onTap: () async {
                                                      final DateTime? picked =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate: DateTime.now(),
                                                        firstDate: DateTime(2025),
                                                        lastDate: DateTime(2050),
                                                      );
                                                      if (picked != null) {
                                                        setState(() {
                                                          datecontroller.text =
                                                              picked
                                                                  .toString()
                                                                  .split(' ')[0];
                                                        });
                                                      }
                                                    },
                                                    child: Icon(Icons
                                                        .calendar_month_outlined)),
                                              ),
                                              readOnly: true,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (fromplace.text.isNotEmpty &&
                                        toplace.text.isNotEmpty &&
                                        datecontroller.text.isNotEmpty) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Seattab(
                                              date: datecontroller.text,
                                              from: fromplace.text,
                                              to: toplace.text,
                                            ),
                                          ));
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(25)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Search Trains",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
                height: 100,
                width: 150,
                fit: BoxFit.cover,
                "assets/images/giphy.gif"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Book Your Train tickets",
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    );
  }

  InkWell _busticketsection(BuildContext context) {
    TextEditingController fromplace = TextEditingController();
    TextEditingController toplace = TextEditingController();

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: 260,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 155,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 30,
                                      right: 50,
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.black,
                                        child: Icon(
                                          Icons.swap_vert,
                                          color: Colors.white,
                                        ),
                                      )),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: Colors.black)),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Column(
                                              children: [
                                                TextField(
                                                  controller: fromplace,
                                                  decoration: InputDecoration(
                                                    hintText: "From",
                                                    hintStyle:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 21),
                                                    prefixIcon:
                                                        Icon(Icons.directions_bus),
                                                  ),
                                                  onChanged: (value) {
                                                    // from=value;
                                                    // setState(() {
                        
                                                    // });
                                                  },
                                                ),
                                                TextField(
                                                    controller: toplace,
                                                    decoration: InputDecoration(
                                                        hintText: "TO",
                                                        hintStyle:
                                                            GoogleFonts.montserrat(
                                                                fontSize: 21),
                                                        prefixIcon: Icon(
                                                            Icons.directions_bus)),
                                                    onChanged: (value) {
                                                      // to=value;
                                                      // setState(() {
                        
                                                      // });
                                                    }),
                                              ],
                                            ),
                                          ],
                                        ),
                                        TextField(
                                          controller: datecontroller,
                                          decoration: InputDecoration(
                                            labelText: "Sselect Date",
                                            prefixIcon: InkWell(
                                                onTap: () async {
                                                  final DateTime? picked =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2025),
                                                    lastDate: DateTime(2050),
                                                  );
                                                  if (picked != null) {
                                                    setState(() {
                                                      datecontroller.text = picked
                                                          .toString()
                                                          .split(' ')[0];
                                                    });
                                                  }
                                                },
                                                child: Icon(
                                                    Icons.calendar_month_outlined)),
                                          ),
                                          readOnly: true,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                if (fromplace.text.isNotEmpty &&
                                    toplace.text.isNotEmpty &&
                                    datecontroller.text.isNotEmpty) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchbusScreen(
                                          date: datecontroller.text,
                                          from: fromplace.text,
                                          to: toplace.text,
                                        ),
                                      ));
                                }
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Search buses",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
                height: 100,
                width: 150,
                fit: BoxFit.cover,
                "assets/images/bus.gif"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Book Your Bus tickets",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _moviesection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          Dummydb().movie.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Moviedetails(
                            index: index,
                          ),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                        height: 200,
                        width: 150,
                        fit: BoxFit.cover,
                        Dummydb().movie[index]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 25,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "8.8",
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "17.5k",
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "votes",
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Text(
                  Dummydb().movieName[index],
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
