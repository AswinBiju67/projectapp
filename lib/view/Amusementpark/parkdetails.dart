import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/controller/metrocontroller.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/Amusementpark/showparkticket.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Parkdetails extends StatefulWidget {
  const Parkdetails({super.key});

  @override
  State<Parkdetails> createState() => _ParkdetailsState();
}

class _ParkdetailsState extends State<Parkdetails> {
  TextEditingController datecontroller = TextEditingController();
  final youtubeurl="https://www.youtube.com/watch?v=1elFHhvYx9o";
  late YoutubePlayerController _yotube;
    _changevalue(int index){
    if(index==0){
      return context.watch<Metrocontroller>().park;
    }else if(index==1){
      return context.watch<Metrocontroller>().park1;
    }else if(index==2){
      return context.watch<Metrocontroller>().park2;
    }else if(index==3){
      return context.watch<Metrocontroller>().park3;
    }else if(index==4){
      return context.watch<Metrocontroller>().park4;
    }else{
      return context.watch<Metrocontroller>().park5;
    }
  }
  @override
  void initState() {
   final videoid= YoutubePlayer.convertUrlToId(youtubeurl);
   _yotube=YoutubePlayerController(initialVideoId: videoid!,
   flags: const YoutubePlayerFlags(
    autoPlay: true,
    mute: true
   ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final parkcount=context.watch<Metrocontroller>().park;
    final parkcount1=context.watch<Metrocontroller>().park1;
    final parkcount2=context.watch<Metrocontroller>().park2;
    final parkcount3=context.watch<Metrocontroller>().park3;
    final parkcount4=context.watch<Metrocontroller>().park4;
    final parkcount5=context.watch<Metrocontroller>().park5;
    int t1=parkcount*1064;
    int t2=parkcount1*1419;
    int t3=parkcount2*1135;
    int t4=parkcount3*1135;
    int t5=parkcount4*1816;
    int t6=parkcount5*2270;
    int ticketrate=t1+t2+t3+t4+t5+t6;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'WonderLa Amusement Park Kochi',
          style:
              GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: YoutubePlayer(
                  controller: _yotube,
                  showVideoProgressIndicator: true,
                  ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Theme parks",
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Water parks",
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Amusement parks",
                        style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sun,5 Jan 2025 - Fri,31 Jan 2025",
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "11.00 AM",
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.access_time_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "4 hours 5 minutes",
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "WonderLa Kochi",
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "About the Event",
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Wonderla is the largest chain of amusement parks in India. It is owned and operated by Wonderla Holidays Limited which is headquartered near Bidadi, 28 kilometres (17 mi) from Bengaluru, Karnataka. It operates 4 amusement parks in Kochi, Bangalore, Hyderabad and Bhubaneswar.Wonderla is promoted by Kochouseph Chittilappilly and his son Arun Chittilappilly. The first amusement park project Wonderla Kochi (then called Veegaland Amusement Park) was set up i…",
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: datecontroller,
                decoration: InputDecoration(
                  labelText: "Select Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: InkWell(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2025),
                          lastDate: DateTime(2050),
                        );
                        if (picked != null) {
                          setState(() {
                            datecontroller.text = picked.toString().split(' ')[0];
                          });
                        }
                      },
                      child: Icon(Icons.calendar_month_outlined)),
                ),
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
             Column(
              children: List.generate(6, (index) =>  Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide())
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Dummydb().park[index],style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),),
                          Text("₹ ${Dummydb().parkprice[index]}",style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),),
                        ],
                      ),
                      Container(
                            width: 100,
                            decoration: BoxDecoration(
                            ),
                            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                InkWell(
                  onTap: () {
                    
                    if(index==0){
                      context.read<Metrocontroller>().ondecrementpark();
                    }else if(index==1){
                      context.read<Metrocontroller>().ondecrementpark1();
                    }else if(index==2){
                      context.read<Metrocontroller>().ondecrementpark2();
                    }else if(index==3){
                      context.read<Metrocontroller>().ondecrementpark3();
                    }else if(index==4){
                      context.read<Metrocontroller>().ondecrementpark4();
                    }else{
                      context.read<Metrocontroller>().ondecrementpark5();
                    }
                  },
                  child: Text("−",style: TextStyle(fontSize: 30),)),
                Text(_changevalue(index).toString()),
                InkWell(
                   onTap: () {
                    if(index==0){
                      context.read<Metrocontroller>().onincrementpark();
                    }else if(index==1){
                      context.read<Metrocontroller>().onincrementpark1();
                    }else if(index==2){
                      context.read<Metrocontroller>().onincrementpark2();
                    }else if(index==3){
                      context.read<Metrocontroller>().onincrementpark3();
                    }else if(index==4){
                      context.read<Metrocontroller>().onincrementpark4();
                    }else{
                      context.read<Metrocontroller>().onincrementpark5();
                    }
                    
                  },
                  child: Icon(Icons.add))
                            ],),
                          ),
                    ],
                  ),
                ),
              ),),
             ),
             Text("Total Amount : $ticketrate",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 20),),
             SizedBox(height: 10,),
              InkWell(
                
                onTap: () {
                  if(datecontroller.text.isNotEmpty && ticketrate != 0){
                    Razorpay razorpay = Razorpay();
                        var options = {
                          'key': 'rzp_test_1DP5mmOlF5G5ag',
                          'amount': ticketrate * 100,
                          'name': 'Bookit PVT LTD.',
                          'description': 'Fine T-Shirt',
                          'retry': {'enabled': true, 'max_count': 1},
                          'send_sms_hash': true,
                          'prefill': {
                            'contact': '8888888888',
                            'email': 'test@razorpay.com'
                          },
                          'external': {
                            'wallets': ['paytm']
                          }
                        };
                        razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                            handlePaymentErrorResponse);
                        razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                            handlePaymentSuccessResponse);
                        razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                            handleExternalWalletSelected);
                        razorpay.open(options);
                  }
                  
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:datecontroller.text.isEmpty ? Colors.grey.shade200 : Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Book Now",
                      style: GoogleFonts.montserrat(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    print(response.code);
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => Showparkticket()));
    print(response.paymentId);
  }

  void handleExternalWalletSelected(PaymentSuccessResponse response) {
    print(response.paymentId);
  }
}
