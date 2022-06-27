import 'package:flutter/material.dart';
import '../constants.dart';
class iconContent extends StatelessWidget {
  iconContent({required this.icon, required this.label});
  // const iconContent({Key? key,}) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(height: 15.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E90),
          ),
        )
      ],
    );
  }
}
