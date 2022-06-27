import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/Bottom_Button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiresult, required this.resultText, required this.interpretation
  });

  final String bmiresult;
  final String resultText;
  final String interpretation;
  // const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Results',
              style: ktitletext,
            ),
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              OnPress: () {},
              cardChild: (Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText, style: ktstyle),
                  Text(bmiresult, style: kbmitstyle),
                  Text(interpretation, textAlign: TextAlign.center,style: kBodytxt),
                ],
              )),
              colour: kactiveColor,
            ),
          ),
          BottomButton(buttontxtTitle: 'RE-CALCULATE',onTaps: (){
            Navigator.pop(context);
          }, ),
        ],
      ),
    );
  }
}
