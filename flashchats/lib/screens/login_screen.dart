import 'package:flashchats/components/rounded_button.dart';
import 'package:flashchats/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashchats/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {

  static const String id  = 'Login_Screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(inAsyncCall: showSpinner,
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
                keyboardType: TextInputType.emailAddress, // to make easier to access the @ symbol in keyboard
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:ktxtfieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: ktxtfieldDecoration.copyWith(hintText: 'Enter you Password')
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(coloR: Colors.lightBlueAccent,ButtonT: 'Login',
                onPress: () async{

                setState((){ showSpinner = true;});
                try{
                  final User = await _auth.signInWithEmailAndPassword(email:
                      email, password: password);

                if (User != null){
                  Navigator.pushNamed(context, ChatScreen.id);
                 // print(User);
                }

                setState((){ showSpinner = false;});
                }catch(e){
                print(e);}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}