import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/controller/metrocontroller.dart';
import 'package:projectapp/controller/selectdatecontroller.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/comdeyshow/comdeyshowwticket.dart';
import 'package:projectapp/view/kidsshow/showkidsticket.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';

class Kidsticketselect extends StatefulWidget {
  int? index;
   Kidsticketselect({super.key,this.index});

  @override
  State<Kidsticketselect> createState() => _BookshowState();
}

class _BookshowState extends State<Kidsticketselect> {
List seat=["GOLD",
"PLATINUM",
"DAIMOND"];

List rate=["1999",
"2499",
"2999"];
void handlePaymentErrorResponse(PaymentFailureResponse response) {
    print(response.code);
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => Showkidsticket(index: widget.index,)));
    print(response.paymentId);
  }

  void handleExternalWalletSelected(PaymentSuccessResponse response) {
    print(response.paymentId);
  }

  @override
  Widget build(BuildContext context) {
    final ticket=context.watch<Metrocontroller>().ticket;
    int ticketrateper=500;
    int ticketrate =ticketrateper*ticket;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(Dummydb().kidsshow[widget.index!],style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  fit: BoxFit.fill,
                  height: 200,
                  width: double.infinity,
                  Dummydb().kids[widget.index!])),
                  SizedBox(height: 30,),
                  _detailsshow(index: widget.index,icon: Icons.calendar_month,txt: Dummydb().kidsdate[widget.index!],),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.access_time_outlined, txt: "1 hour 30 minutes"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.access_time_filled, txt: "05:00 PM"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.person, txt: " Age Limit - 8yes +"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.language, txt: "English,Hindi"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.location_on_outlined, txt: "Shilpakala Vedika: Hyderabad"),
                  SizedBox(height: 25,),
                  Text("About th Event",style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,fontSize: 20
          ),),
          Text("There are many approaches on how to solve the Rubik's Cube. All these methods have different levels of difficulties, for speedcubers or beginners, even for solving the cube blindfolded. People usually get stuck solving the cube after completing the first face, after that they need some help. In the following article I'm going to show you the easiest way to solve the cube using the beginner's method.",
          textAlign: TextAlign.justify,),
          SizedBox(height: 30,),
          Text("Entry Per Prson : $ticketrateper",style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700
        ),),
        SizedBox(height: 10,),
          Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue,width: 2)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                InkWell(
                  onTap: () {
                    context.read<Metrocontroller>().ondecrementticket();
                  },
                  child: Text("−",style: TextStyle(fontSize: 30),)),
                Text("$ticket"),
                InkWell(
                   onTap: () {
                    context.read<Metrocontroller>().onincrementticket();
                  },
                  child: Icon(Icons.add))
              ],),
            ),
          ),
          SizedBox(height: 10,),
          Center(child: InkWell(
            onTap: () {
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
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ticket == null ? Colors.grey.shade300 :Colors.blue
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Book Ticket",style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,fontSize: 18,color: ticket == null ? Colors.black :Colors.grey.shade200
                        ),),
              )),
          ))
            ],
          ),
        ),
      ),
    );
  }
}

class _detailsshow extends StatelessWidget {
  IconData? icon;
  String? txt;
   _detailsshow({
    super.key,
    this.index,
    required this.icon,
    required this.txt,

    
  });

  final int? index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10,),
        Text(txt!,style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700
        ),),
      ],
    );
  }
  
}