import 'package:flutter/material.dart';
import 'package:bmi_calculator/Screens/input_page.dart';
class ReusableCard extends StatelessWidget {
  // const ReusableCard({Key? key,}) : super(key: key);
  ReusableCard({required this.colour, required this.cardChild, required this.OnPress});
  final Color colour;
  final Widget cardChild;
  final Function() OnPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
