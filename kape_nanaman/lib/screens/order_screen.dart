//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:kape_nanaman/constText.dart';
import 'package:kape_nanaman/constant/ConstItems.dart';
import 'package:kape_nanaman/screens/login.dart';

class orderScreen extends StatefulWidget {
  //const _adson({Key? key}) : super(key: key);
  static const String id = 'orderscreen';

  @override
  State<orderScreen> createState() => orderScreenState();
}

class orderScreenState extends State<orderScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('Hot Coffee', style: kappBartxt),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            icon: Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.purpleAccent,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
            ),
          ],
        ),
        //height: size.height / 2,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(20)
        //
        //   ),

        //child: ListView(children: [Container(color: Colors.greenAccent,)],),
        //child: Row( mainAxisAlignment: MainAxisAlignment.center,children: [Container(color: Colors.black26,height: size.width/1.5,width: size.width/1.5,), Container(color: Colors.greenAccent,height: size.width/1.5, width: size.width/1.5,),]),
      ),

      // body: Container20
      //   child: Expanded(
      //     child: ListView(
      //         padding: const EdgeInsets.all(8),
      //             children: [
      //               //Column(
      //                 Container(color: Colors.black54,
      //                   width:size.width,height:size.height,
      //                   child: Row (children: [Container(color: Colors.black54,
      //                     width:size.width/2,height:size.width/2),Container(color: Colors.black26,
      //                     width:size.width/2,height:size.width/2,),
      //                   ],),
      //                 ),

      // children: [Container(child: Image.asset('$lists'),)],
      // ),
      //                ],
      //              ),
      //      ),
      //    ),
      //
      //    );
    );
  }
}
