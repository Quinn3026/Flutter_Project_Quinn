import 'package:flutter/material.dart';
import 'package:kape_nanaman/screens/register.dart';

class RoundedButton extends StatelessWidget {
  // const RoundedButton({Key key,}) : super(key: key);

  RoundedButton({required this.coloR,required this.ButtonT,required this.onPress});
  final Color coloR;
  final String ButtonT;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: coloR,
        // coloR,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: (){},
          minWidth: 200.0,
          height: 42.0,
          child: Text(ButtonT,style: TextStyle(color: Colors.white),),

        ),
      ),
    );
  }
}
