import 'package:flashchats/constants.dart';
import 'package:flutter/material.dart';
import 'package:flashchats/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchats/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {

  static const String id  = 'Registration_Screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String Email;
  String Password;
  bool showSpinner = false;

  final _auth = FirebaseAuth.instance; // private because of _

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  Email = value;//Do something with the user input.
                },
                decoration: ktxtfieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true, // to make pa password divisible by dots
                onChanged: (value) {
                  Password = value;//Do something with the user input.
                },
                decoration: ktxtfieldDecoration.copyWith(hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
             RoundedButton(coloR: Colors.blueAccent,ButtonT: 'Register',onPress: () async{
               // print(Email);
               // print(Password);
               showSpinner = true;
               setState((){});
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: Email, password: Password);
                  if (newUser != null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  showSpinner = false;
                  setState((){});
                }
                catch (e){
                  print(e);
           }},
  ),
            ],
          ),
        ),
      ),
    );
  }
}
