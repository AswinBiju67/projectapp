import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectapp/view/homescreen/homescreen.dart';
import 'package:projectapp/view/registerscreen.dart/registrationscreen.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                )
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (_loginFormKey.currentState!.validate()) {
                    
                  }
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Homescreen()), (route) => false,);
                },
                child: Text('Login',style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.blueAccent),),
              ),
              SizedBox(height: 10,),
              Text("or",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              CircleAvatar(radius: 25,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/google-logo-clipart-transparent.png"),),
              SizedBox(height: 30,),
              Text("don't have an account",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w500),),
              InkWell(
                onTap: () {
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),), (route) => false,);
                }, 
                child: Text('Create an Account',style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.blueAccent,decoration: TextDecoration.underline,decorationColor: Colors.blueAccent),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}