import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/controller/selectcontroller.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/comdeyshow/comdeyshowwticket.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';

class Bookshow extends StatefulWidget {
  int? index;
   Bookshow({super.key,this.index});

  @override
  State<Bookshow> createState() => _BookshowState();
}

class _BookshowState extends State<Bookshow> {
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
        context, MaterialPageRoute(builder: (builder) => Comdeyshowwticket(index: widget.index,)));
    print(response.paymentId);
  }

  void handleExternalWalletSelected(PaymentSuccessResponse response) {
    print(response.paymentId);
  }

  @override
  Widget build(BuildContext context) {
    final ticket=context.watch<Selectdatecontroller>().showticket;
    int ticketrate;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(Dummydb().comdeyname[widget.index!],style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
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
                  Dummydb().comdey[widget.index!])),
                  SizedBox(height: 30,),
                  _detailsshow(index: widget.index,icon: Icons.calendar_month,txt: Dummydb().comdeydate[widget.index!],),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.access_time_outlined, txt: "1 hour 30 minutes"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.access_time_filled, txt: "05:00 PM"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.person, txt: " Age Limit - 16yes +"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.language, txt: "Hindi"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.location_on_outlined, txt: "Shilpakala Vedika: Hyderabad"),
                  SizedBox(height: 25,),
                  Text("About th Event",style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,fontSize: 20
          ),),
          Text("Stand-up comedy is a performance directed to a live audience, where the performer stands on a stage and delivers humorous and satirical monologues sometimes incorporating physical acts. These performances are typically composed of rehearsed scripts but often include varying degrees of live crowd interaction. Stand-up comedy consists of one-liners, stories, observations, or shticks that can employ props, music, impressions, magic tricks, or ventriloquism.",
          textAlign: TextAlign.justify,),
          SizedBox(height: 30,),
          Text("Select Ticket"),
          Column(children: List.generate(3, (index) => 
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
                context.read<Selectdatecontroller>().selectshowticket(index);
                index=ticket!;
              },
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color:ticket == index ?Colors.blue : Colors.grey.shade300
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(seat[index],style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: ticket == index ?Colors.white : Colors.black
                      ),),
                      SizedBox(height: 10,),
                      Text(rate[index],style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: ticket == index ?Colors.white : Colors.black
                      ),),
                  
                    ],
                  ),
                ),
              ),
            ),
          ),),),
          SizedBox(height: 20,),
          Center(child: InkWell(
            onTap: () {
              if(ticket == 0){
                ticketrate=1999;
              }else if(ticket == 1){
                ticketrate=2499;
              }else{
                ticketrate=2999;
              }
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