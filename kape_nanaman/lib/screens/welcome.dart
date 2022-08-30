import 'package:flutter/material.dart';
import 'package:kape_nanaman/constText.dart';
import 'package:kape_nanaman/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kape_nanaman/screens/register.dart';




class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  String name = '';
  String num = '';
  String email = ' ';
  String password = ' ';
  bool showPassword = false;


  @override
  void initState() {
    super.initState();
    showPassword;
    // getCurrentUser();
  }
  void getCurrentUser() async{
    final user = await _auth.currentUser;
    if (user != null){
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: (DecorationImage(
            image: AssetImage('images/12.png'),
            fit: BoxFit.cover,
          )),
        ),
        constraints: BoxConstraints.expand(),
        //backgroundColor: Color.fromRGBO(129, 70, 20, 5),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white70,
                        backgroundImage: AssetImage('images/C.png'),
                      ),
                      Column(
                        children: [
                          Text(
                                'Mr.Coffeein',
                                style: kTextstyle),

                          Text('"Its not just coffee, \n Its an experience"', style: kTEXT,),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: ktxtfieldDecor.copyWith(
                            prefixIcon: Icon(
                              Icons.email,
                              size: 30,
                            ),
                            hintText: 'Enter your email',
                            hintStyle: kstyleText,
                            labelText: 'Email',
                            labelStyle: kstyleText),
                        style: kTexthint,
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextField(keyboardType: TextInputType.emailAddress,
                          decoration: ktxtfieldDecor.copyWith(
                              prefixIcon: TextButton(onPressed: (){
                                showPassword =! showPassword;
                                setState((){});},
                                child: Icon(
                                    showPassword ? Icons.key_off:Icons.key),),
                              hintText: 'Enter a Password',
                              hintStyle: kstyleText,
                              labelText: 'Password',
                              labelStyle: kstyleText),
                          style: kTexthint,
                          obscureText: !showPassword,
                          onChanged: (value) {password = value;}),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Material(
                    color: Colors.blueAccent,
                ),
              MaterialButton(elevation: 23,
                   color: Color.fromRGBO(129, 70, 20, 5),
                        // minWidth: 200,
                        // height: 42,
                        child: Text(
                          'Login',
                          style: kTexthint,
                        ),
                        onPressed: () async {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);

                            if (user != null) {
                              Navigator.pushNamed(context, LoginScreen.id);
                              print('Good Morning!, $name.');
                            }
                          } catch (e) {
                            print(e);
                          }
                        }),

                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Dont have Account?'),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Registers.id);
                        },
                        child: Text(
                          '|SignUp|',
                          style: kTexthint,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
       ),
      ),
    );
  }
}
