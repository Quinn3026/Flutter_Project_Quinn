import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  //const RoundIconButton({Key? key}) : super(key: key);

  RoundIconButton({required this.icon, required this.OnPressed});

  final IconData icon;
  final Function() OnPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: OnPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}