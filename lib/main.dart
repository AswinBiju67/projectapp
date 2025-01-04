import 'package:flutter/material.dart';
import 'package:projectapp/controller/metrocontroller.dart';
import 'package:projectapp/controller/selectdatecontroller.dart';
import 'package:projectapp/view/splashscreen.dart/splashscreen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Selectdatecontroller(),),
        ChangeNotifierProvider(create: (context) => Metrocontroller(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}