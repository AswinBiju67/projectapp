import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/view/busscreen/passgenerinfo.dart';

class ChooseSeat extends StatefulWidget {
  ChooseSeat({Key? key}) : super(key: key);

  @override
  State<ChooseSeat> createState() => _ChooseSeatState();
}

class _ChooseSeatState extends State<ChooseSeat> {
  var countSeatCenter = 4 * 10;
  var listSeatCenter = [];

  @override
  void initState() {

    initSeatValueToList(listSeatCenter, countSeatCenter, "c");
    setVisiblitySeat();
    super.initState();
  }

  initSeatValueToList(List data, count, side) {
    var objectData;
    //init variable to save your object data
    for (int i = 0; i < count; i++) {
      objectData = {
        "id": side + "${i + 1}",
        "isBooked": false,
        "isAvailable": true,
        "isSelected": false,
        "isVisible": true,
      };
      //this format object for every seat has
      setState(() {
        data.add(objectData);
        //add object to list
      });
    }
    print(data);
  }

  setVisiblitySeat() {
   
  }

  setSelectedToBooked() {
   
    listSeatCenter.forEach((seat) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
      backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 150,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Seats",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "Thodupuzha",
                      style: GoogleFonts.montserrat(),
                    ),
                    Icon(Icons.arrow_right),
                    Text(
                      "Bengaluru",
                      style: GoogleFonts.montserrat(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // child: Text("Screen"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "Booked",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("Selected"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("available"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              // height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // widgetSeat(listSeatLeft, false),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: widgetSeat(listSeatCenter, true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  // widgetSeat(listSeatRight, false),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Passinfo(),));
              },
              child: Text("Book Now",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,color: Colors.blue,fontSize: 18),)),
          ],
        ),
      ),
      bottomSheet: 
      Container(
        height: 260,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade400
                ),),
              ),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "KSRTC (Kerala)",
                            style:
                                GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "17:30-08:35 . Sat, 23 Nov",
                            style: GoogleFonts.montserrat(),
                          ),
                          Text(
                            "Swift Deluxe Non Ac Air Bus (2+2)",
                            style: GoogleFonts.montserrat(),
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber.shade100),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, left: 5, right: 5),
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.brown.shade300),
                                    child: Row(
                                      children: [
                                      Icon(Icons.star_border_outlined,color: Colors.white,),
                                      SizedBox(width: 5,),
                             Text("3.1",style: GoogleFonts.montserrat(color: Colors.white),),
                                    ],),
                              ),
                            ),
                             Text("6",style: GoogleFonts.montserrat(),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            height: 140,
                            "assets/images/OIP.jpeg"),
                        ),
                          SizedBox(width: 10,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                             height: 140,
                            "assets/images/ksrtc.jpg"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetSeat(List dataSeat, bool isCenter) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isCenter ? 4 : 3,
                  childAspectRatio: isCenter ? 1 : 1,
                ),
                itemCount: dataSeat.length,
                itemBuilder: (BuildContext context, int index) {
                  return Visibility(
                    visible: dataSeat[index]["isVisible"],
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          dataSeat[index]["isSelected"] =
                              !dataSeat[index]["isSelected"];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 30,
                        height: 40,
                        decoration: BoxDecoration(
                          color: dataSeat[index]["isBooked"]
                              ? Colors.grey
                              : dataSeat[index]["isSelected"]
                                  ? Colors.blue
                                  : Colors.transparent,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}