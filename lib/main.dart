import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/controller/amusementcontroller.dart';
import 'package:projectapp/controller/eventcontroller.dart';
import 'package:projectapp/controller/logincontroller.dart';
import 'package:projectapp/controller/countcontroller.dart';
import 'package:projectapp/controller/movieorderscontroller.dart';
import 'package:projectapp/controller/profilecontroller.dart';
import 'package:projectapp/controller/registercontroller.dart';
import 'package:projectapp/controller/selectcontroller.dart';
import 'package:projectapp/controller/ticketcontroller.dart';
import 'package:projectapp/firebase_options.dart';
import 'package:projectapp/view/splashscreen.dart/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
        ChangeNotifierProvider(create: (context) => Logincontroller(),),
        ChangeNotifierProvider(create: (context) => Registrationcontroller(),),
        ChangeNotifierProvider(create: (context) => Profilecontroller(),),
        ChangeNotifierProvider(create: (context) => Ticketcontroller(),),
        ChangeNotifierProvider(create: (context) => Movieorderscontroller(),),
        ChangeNotifierProvider(create: (context) => Amusementcontroller(),),
        ChangeNotifierProvider(create: (context) => Eventcontroller(),),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white)
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}