import 'package:flutter/material.dart';
import 'Screens/input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  //const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // primaryColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Color(0xFF020725), secondary: Color(0xFF03F299)),
        scaffoldBackgroundColor: Color(0xFF0A0E21),

      ),
      home: InputPage(),
    );
  }
}



