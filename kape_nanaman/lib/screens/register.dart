import 'package:flutter/material.dart';
import 'package:kape_nanaman/constText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kape_nanaman/screens/welcome.dart';

class Registers extends StatefulWidget {
  static const String id = 'regs';
  // const Registers({Key? key}) : super(key: key);

  @override
  _RegistersState createState() => _RegistersState();
}

class _RegistersState extends State<Registers> {
  final _auth = FirebaseAuth.instance;

  String Name = '';
  String Number = '';
  String Email = '';
  String Password = '';
  bool showPassword = false;
  @override
  void initState() {
    super.initState();
    showPassword;
    // getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar( backgroundColor: Color(0xffB8860E),centerTitle: true,
    title: Text('Mr. Coffeein',
        style: kapptxt),),
        body: Container(
      decoration: BoxDecoration(
        image: (DecorationImage(
          image: AssetImage('images/12.png'),
              //'images/12.png'), RMDNAMNYC
          fit: BoxFit.cover,
        )),
      ),
      child: ListView(
        children: [ Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [ CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.white70,
            backgroundImage: AssetImage('images/C.png'),
          ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: ktxtfieldDecor.copyWith(
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  hintText: 'Enter your Username',
                  hintStyle: kstyleText,
                  labelText: 'Username',
                  labelStyle: kstyleText),
              style: kTexthint,
              onChanged: (value) {
                Name = value;
              },
            ),
            SizedBox(
              height: 20,
            ),

            TextField(
                decoration: ktxtfieldDecor.copyWith(
                    prefixIcon: Icon(
                      Icons.email,
                      size: 30,
                    ),
                    hintText: 'Enter your Email',
                    hintStyle: kstyleText,
                    labelText: 'Email',
                    labelStyle: kstyleText),
                style: kTexthint,
                onChanged: (value) {
                  Email = value;
                }),
            SizedBox(
              height: 20,
            ),
            TextField(
                decoration: ktxtfieldDecor.copyWith(
                    prefixIcon: TextButton(onPressed: (){
                      showPassword =! showPassword;
                      setState((){});
                    },
                      child: Icon(showPassword ? Icons.key_off:Icons.key),
                    ),
                    hintText: 'Enter a Password',
                    hintStyle: kstyleText,
                    labelText: 'Password',
                    labelStyle: kstyleText),
                style: kTexthint,
                obscureText: !showPassword,
                onChanged: (value) {
                  Password = value;
                }),
            MaterialButton(
              onPressed: () async {
                try {
                  // final newUse = await _auth.confirmPasswordReset(code: Password, newPassword: Password);
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: Email, password: Password,);
                  if (newUser != null) {
                     Navigator.pushNamed(context, WelcomeScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
              minWidth: 100,
              height: 40,
              child: Text(
                'SignUp!',
                style: kTexthint,
              ),
            )
          ],
        ),
      ]),
    ));
  }
}
