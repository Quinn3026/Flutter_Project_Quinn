import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTaps, required this.buttontxtTitle});

  final Function() onTaps;
  final String buttontxtTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaps,
      child: Container(
        child: Center(
          child: Text(
            buttontxtTitle,
            style: kLargeButton,
          ),
        ),
        color: kbottomColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all( 20),
        width: double.infinity,
        height: kBottonContainerHeight,
      ),
    );
  }
}
