import 'package:flutter/material.dart';
import 'package:kape_nanaman/screens/order_screen.dart';
import 'package:kape_nanaman/screens/register.dart';
import 'package:kape_nanaman/screens/welcome.dart';
import 'package:kape_nanaman/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: MyApp(),
     debugShowCheckedModeBanner: false,
     initialRoute: WelcomeScreen.id,
     routes: {
       WelcomeScreen.id: (context) => WelcomeScreen(),
       LoginScreen.id: (context) => LoginScreen(),
       Registers.id: (context) => Registers(),
       orderScreen.id: (context) => orderScreen(),
     },
   );
  }
}

