import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Dice Game!',
            style: TextStyle(fontFamily: 'Teko', fontSize: 40),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  //const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int a = 1;
  int b = 6;



  //List LDiceNumber = 5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Image.asset('images/$a.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                // setState(
                //       (){
                //
                //   },
                // );
              },
              child: Image.asset('images/$b.png'),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  b = Random().nextInt(6) + 1;
                  a = Random().nextInt(6) + 1;
                  setState(() {});
                },
                child: const Text(
                  'Press Here!',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Teko'),
                ),

                style:  ButtonStyle(shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
