import 'package:flutter/material.dart';
import 'package:quiz_flut/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());
QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal.shade900,centerTitle: true, title: Text('Quizzler')),
        backgroundColor: Colors.blue.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // var a = myString[0:0];
  List<Icon> scoreKeeper = [
    // Icon(Icons.check, color: Colors.green),
    // Icon(Icons.close, color: Colors.red),
    // Icon(Icons.check, color: Colors.green),
    // Icon(Icons.close, color: Colors.red),
    // Icon(Icons.check, color: Colors.green),
  ];
  void Checkans(bool userPickedAns) {
    bool corans = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: "End of the Quiz!",
                desc: "The quiz will be reset after you tap the cancel button")
            .show();

        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAns == corans) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }
        quizBrain.Nextquest();
        setState(() {});
      }
    });
  }

  // List<String> myString = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  // List<bool> Ans = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                //'This is where the question text will go.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Checkans(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Checkans(false);
                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
