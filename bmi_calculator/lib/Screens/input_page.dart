import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/icon_content.dart';
import '../../constants.dart';
import 'package:bmi_calculator/Screens/resultpage.dart';
import 'package:bmi_calculator/Components/Bottom_Button.dart';
import 'package:bmi_calculator/Components/Round_Icon_Button.dart';
import 'package:bmi_calculator/brain_calculator.dart';

enum GEnder {
  male,
  female,
}

class InputPage extends StatefulWidget {
  //const InputPage({Key? key}) : super(key: k.ey);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GEnder? selectedGender;
  int height = 180;
  int weight = 60;
  int Age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = GEnder.male;
                    });
                  },
                  child: ReusableCard(
                    OnPress: () {
                      selectedGender = GEnder.male;
                      setState(() {});
                    },
                    colour: selectedGender == GEnder.male
                        ? kactiveColor
                        : kinactiveColor,
                    cardChild: iconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  OnPress: () {
                    selectedGender = GEnder.female;
                    setState(() {});
                  },
                  colour: selectedGender == GEnder.female
                      ? kactiveColor
                      : kinactiveColor,
                  cardChild: iconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  OnPress: () {},
                  colour: kactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: klabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTxtStyle,
                          ),
                          Text(
                            'cm',
                            style: klabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFF008080),
                          overlayColor: Color(0x29008080),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20.0),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              height = newValue.round();
                              setState(() {});
                            }),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  OnPress: () {},
                  colour: kactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: klabelTextStyle),
                      Text(weight.toString(), style: kNumberTxtStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            OnPressed: () {
                              weight++;
                              setState(() {});
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            OnPressed: () {
                              weight--;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  OnPress: () {},
                  colour: kactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: klabelTextStyle),
                      Text(Age.toString(), style: kNumberTxtStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            OnPressed: () {
                              Age++;
                              setState(() {});
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            OnPressed: () {
                              Age--;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),),
          BottomButton(buttontxtTitle: 'CALCULATE', onTaps: (){

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
              bmiresult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            ),),);
          },),
        ],),);
  }
}



