import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/view/busscreen/ticket.dart';
import 'package:razorpay_web/razorpay_web.dart';

class Passinfo extends StatefulWidget {
  const Passinfo({super.key});

  @override
  State<Passinfo> createState() => _PassinfoState();
}

class _PassinfoState extends State<Passinfo> {
   void handlePaymentErrorResponse(PaymentFailureResponse response) {
    print(response.code);
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => MyTicketView()));
    print(response.paymentId);
  }

  void handleExternalWalletSelected(PaymentSuccessResponse response) {
    print(response.paymentId);
  }
  @override
  Widget build(BuildContext context) {
    int calculatedPrice=855;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar:  AppBar(
        backgroundColor: Colors.white,
        actions: [ Padding(
          padding: const EdgeInsets.only(right: 130),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selected boarding & dropping points"),
              Row(
                children: [
                  Text("Thodupuzha"),
                  Icon(Icons.arrow_right),
              Text("Bengaluru"),
                ],
              ),
              
            ],
          ),
        ),],),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                  Column(
                    children: [
                      Center(child: Text("KSRTC")),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fri, 22Nov . 17:30",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
                            Text("Thodupuzha")
                          ],
                        ),
                        Icon(Icons.arrow_right_alt),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Sat,22 Nov . 06:35",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
                            Text("Srianga patna")
                          ],
                        ),
                      ],
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  Icon(Icons.person_2_outlined),
                                  SizedBox(width: 5,),
                                  Text("1 seat")
                                ],),
                              ),),
    
                       ],
                     ),
                   )
                ],),
              ),
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Contact Details",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 25),),
                              Text("Ticket details will be sent to")
                            ],
                          ),
                          Text("Edit",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 17),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(children: [
                        Icon(Icons.email_outlined),
                        SizedBox(width: 5,),
                        Text("aswin99@gmail.com",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 15),)
                      ],),
                       SizedBox(height: 10,),
                      Row(children: [
                        Icon(Icons.phone_outlined),
                        SizedBox(width: 5,),
                        Text("+ 91 735653XXXX",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 15),)
                      ],),
                       SizedBox(height: 10,),
                      Row(children: [
                        Icon(Icons.place_outlined),
                        SizedBox(width: 5,),
                        Text("Kerala",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 15),)
                      ],),
                      
                    ],
                  ),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Passenger details",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 25),),
                      Text("0/1 selected"),
                      SizedBox(height: 10,),
                      Text("Select 1 Male passenger",style: GoogleFonts.montserrat(fontSize: 17),),
                      SizedBox(height: 5,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.shade100
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Icon(Icons.person_add_alt_outlined),
                          SizedBox(width: 5,),
                          Text("Add new passenger",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),)
                        ],),
                      ),),
                      SizedBox(height: 10,),
                      Divider(color: Colors.grey.shade300,),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row(
                          children: [
                            CircleAvatar(backgroundColor: Colors.purple.shade100,
                            child: Icon(Icons.person_2_outlined),),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Aswin",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
                                Text("Male, 21 Years")
                              ],
                            )
                          ],
                        ),
                        Checkbox(value: true, onChanged: (value) => value,)
                      ],)
                    ],
                  ),
                ),
                ),
              ),
              SizedBox(height: 10,),
              Text("BY clicking 'Pay now' I accept"),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Amount",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
                            Text("Tax excluded")
                          ],
                        ),
                        Text("₹ 855")
                      ],
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Razorpay razorpay = Razorpay();
                              var options = {
                                'key': 'rzp_test_1DP5mmOlF5G5ag',
                                'amount': calculatedPrice* 100,
                                'name': 'Acme Corp.',
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
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(child: Text("Pay now",style: GoogleFonts.montserrat(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.white),)),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              )
            ],
          ),
        ),
    );
  }
}