import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/controller/eventcontroller.dart';
import 'package:projectapp/controller/selectcontroller.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/comdeyshow/comdeyshowwticket.dart';
import 'package:projectapp/view/musicshow/showmusicticket.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';

class Selectticketmusic extends StatefulWidget {
  int? index;
   Selectticketmusic({super.key,this.index});

  @override
  State<Selectticketmusic> createState() => _BookshowState();
}

class _BookshowState extends State<Selectticketmusic> {
List seat=["Lolla VIP",
"GA",
"RuPay Comfort"];

List rate=["13999",
"6999",
"8999"];
void handlePaymentErrorResponse(PaymentFailureResponse response) {
    print(response.code);
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    context.read<Eventcontroller>().additem(tittle: Dummydb().musicshow[widget.index!], person: 1, image: Dummydb().music[widget.index!], price: 13999, date: Dummydb().musicdate[widget.index!], type: "VIP", event: "Music Show");
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => Showmusicticket()));
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
        title: Text(Dummydb().musicshow[widget.index!],style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
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
                  Dummydb().music[widget.index!])),
                  SizedBox(height: 30,),
                  _detailsshow(index: widget.index,icon: Icons.calendar_month,txt: Dummydb().musicdate[widget.index!],),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.access_time_outlined, txt: "8 hour"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.access_time_filled, txt: "06:00 PM"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.person, txt: " All Age Group"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.language, txt: "English,Hindi"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.location_on_outlined, txt: "Mahalaxmi Race Course: Mumbai"),
                  SizedBox(height: 25,),
                  Text("About th Event",style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,fontSize: 20
          ),),
          Text("A concert is a live music performance in front of an audience. [1] The performance may be carried by a single musician, sometimes then called a recital, or by a musical ensemble, such as an orchestra, choir, or band.",
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
                ticketrate=13999;
              }else if(ticket == 1){
                ticketrate=6999;
              }else{
                ticketrate=8999;
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