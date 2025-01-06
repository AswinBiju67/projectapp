import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/controller/countcontroller.dart';
import 'package:projectapp/controller/selectcontroller.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/Sportsevent/showticketsports.dart';
import 'package:projectapp/view/musicshow/showmusicticket.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';

class Sportsdetailscreen extends StatefulWidget {
  int? index;
   Sportsdetailscreen({super.key,this.index});

  @override
  State<Sportsdetailscreen> createState() => _BookshowState();
}

class _BookshowState extends State<Sportsdetailscreen> {
List rate=["100",
"200",
"300","350","800","2000"];

List seat=[Colors.purple.shade200,Colors.green,Colors.pink,Colors.blue,Colors.orange.shade600,Colors.purple];


void handlePaymentErrorResponse(PaymentFailureResponse response) {
    print(response.code);
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => Showticketsports(index: widget.index,)));
    print(response.paymentId);
  }

  void handleExternalWalletSelected(PaymentSuccessResponse response) {
    print(response.paymentId);
  }

  @override
  Widget build(BuildContext context) {
    final ticket=context.watch<Selectdatecontroller>().sportstickets;
    final person=context.watch<Metrocontroller>().sports;
    int ticketrate;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(Dummydb().sportsname[widget.index!],style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
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
                  Dummydb().sports[widget.index!])),
                  SizedBox(height: 30,),
                  _detailsshow(index: widget.index,icon: Icons.calendar_month,txt: Dummydb().sportdate[widget.index!],),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.access_time_outlined, txt: "1 hour 30 minutes"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.access_time_filled, txt: "07:30 PM"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.person, txt: " Age Limit -2yrs +"),
                  SizedBox(height: 10,),
                  _detailsshow(icon: Icons.location_on_outlined, txt: "Jawaharlal Neharu Stadium: Chennai"),
                  SizedBox(height: 25,),
                  Text("About th Event",style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,fontSize: 20
          ),),
          Text("The Indian Super League (ISL) is the men's highest level of the Indian football league system. Administered by the All India Football Federation (AIFF) and its commercial partner Football Sports Development Limited (FSDL),[1][2] the league is currently contested by 13 clubs.",
          textAlign: TextAlign.justify,),
          SizedBox(height: 30,),
          Image.asset("assets/images/stad.jpg"),
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
                    context.read<Metrocontroller>().ondecrementsports();
                  },
                  child: Text("−",style: TextStyle(fontSize: 30),)),
                Text("$person"),
                InkWell(
                   onTap: () {
                    context.read<Metrocontroller>().onincrementsports();
                  },
                  child: Icon(Icons.add))
              ],),
            ),
          ),
          SizedBox(height: 10,),
          Text("Select Ticket"),
          Column(children: List.generate(rate.length, (index) => 
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
                context.read<Selectdatecontroller>().sportsticket(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: seat[index]),
                  borderRadius: BorderRadius.circular(10),
                  color:ticket == index ?Colors.blue : Colors.grey.shade300
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      SizedBox(height: 10,),
                      Text(rate[index],style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color:seat[index]
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

             if(ticket==0){
              ticketrate=100;
             }else if(ticket==1){
              ticketrate=200;
             }else if(ticket==2){
              ticketrate=300;
             }else if(ticket==3){
              ticketrate=350;
             }else if(ticket==4){
              ticketrate=800;
             }else{
              ticketrate=2000;
             }
               Razorpay razorpay = Razorpay();
                        var options = {
                          'key': 'rzp_test_1DP5mmOlF5G5ag',
                          'amount': ticketrate * person*100,
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