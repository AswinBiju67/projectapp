import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/controller/metrocontroller.dart';
import 'package:projectapp/dummydb.dart';
import 'package:projectapp/view/metrocreen/ticketmetro.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';

class Metrotab extends StatefulWidget {
  int? index;
   Metrotab({super.key, this.index});

  @override
  State<Metrotab> createState() => _MetrotabState();
}

class _MetrotabState extends State<Metrotab> {
  TextEditingController fromplace = TextEditingController();
  TextEditingController toplace = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int calculatedPrice = 20 * context.watch<Metrocontroller>().count;
    return Scaffold(
      appBar: AppBar(
        title: Text("Metro Tecket Booking",
            style: GoogleFonts.montserrat(
                fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Center(
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Dummydb().metroname[widget.index!],
                              style: GoogleFonts.montserrat(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Image.asset(height: 60, Dummydb().metro[widget.index!]),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                  Container(
                    height: 165,
                    width: double.infinity,
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
                                        GoogleFonts.montserrat(fontSize: 21),
                                    prefixIcon: Icon(Icons.directions_train),
                                  ),
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                                TextField(
                                    controller: toplace,
                                    decoration: InputDecoration(
                                        hintText: "TO",
                                        hintStyle: GoogleFonts.montserrat(
                                            fontSize: 21),
                                        prefixIcon:
                                            Icon(Icons.directions_train)),
                                    onChanged: (value) {
                                      setState(() {});
                                    }),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 66,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Passengers ",
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17)),
                                      Text(
                                        "Price/Person",
                                        style: GoogleFonts.montserrat(),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                    height: 50,
                                    width: 152,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            context
                                                .read<Metrocontroller>()
                                                .ondecrement();
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15)),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Icon(
                                              Icons.delete_outline,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Center(
                                                child: Text(
                                              context
                                                  .watch<Metrocontroller>()
                                                  .count
                                                  .toString(),
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 30),
                                            ))),
                                        InkWell(
                                          onTap: () {
                                            context
                                                .read<Metrocontroller>()
                                                .onincrement();
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.red.shade200,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15)),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Icon(
                                              Icons.add,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _pay(context, calculatedPrice),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell _pay(BuildContext context, int calculatedPrice) {
    return InkWell(
      onTap: () {
        if (fromplace.text.isNotEmpty && toplace.text.isNotEmpty) {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 120,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Ticket Price per person: ${calculatedPrice} ",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ticket Total Price: ${calculatedPrice} ",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Razorpay razorpay = Razorpay();
                        var options = {
                          'key': 'rzp_test_1DP5mmOlF5G5ag',
                          'amount': calculatedPrice * 100,
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
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Continue to Payment",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Book ticket",
                style: GoogleFonts.montserrat(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    print(response.code);
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => Ticketmetro()));
    print(response.paymentId);
  }

  void handleExternalWalletSelected(PaymentSuccessResponse response) {
    print(response.paymentId);
  }


}
