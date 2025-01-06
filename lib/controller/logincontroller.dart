import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logincontroller with ChangeNotifier{
  Future<void> onLogon(
    {
      required String email,required String password,required BuildContext context
    }
  ) async {
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  if(credential != null){
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Homescreen(),), (route) => false,);
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Logging in...')),
    );
  }else{
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Login Failed'))
    );
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }
}