
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/view/homescreen/homescreen.dart';
import 'package:projectapp/view/loginscreen.dart/loginscreen.dart';

class AuthHandeler extends StatelessWidget {
  const AuthHandeler({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }else if(snapshot.hasData){
        return Homescreen();
      }else{
        return LoginScreen();
      }
    },);
  }
}