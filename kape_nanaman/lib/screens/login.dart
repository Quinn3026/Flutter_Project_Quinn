import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kape_nanaman/constText.dart';
import 'package:flutter/services.dart' as itemBuilder;
import 'package:kape_nanaman/constant/ConstItems.dart';


class LoginScreen extends StatefulWidget {

  static const String id = 'logIns';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffB8860E),
        centerTitle: true,
        title: Text('Menu', style: kapptxt),
      ),

      body: Container(decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/12.png'),
              fit: BoxFit.cover
          )
      ),
        child: FutureBuilder(
            future: ReadJsonData(),
            builder: (context, data){
              if(data.hasError){
                return Center(child: Text("${data.error}"),);
              }else if(data.hasData){
                var Item = data.data as List<CoffeeItems>;

                return ListView.builder(
                    itemCount: Item == null? 0: Item.length,
                    itemBuilder: (context,index){

                  return Card(color: Color(0x77DCC081),
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical:6),
                    child: Container(
                        //color: Color(0xffffee99)),
                      padding: EdgeInsets.all(8),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: Image(image: AssetImage(Item[index].Images.toString()),fit: BoxFit.cover),
                            ),
                            Expanded(child: Container(
                              padding: EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 10,right: 10,),
                                  child: Text(Item[index].Name.toString(), style: kappBartxt,),),

                                  Padding(padding: EdgeInsets.only(left: 10,right: 10,),
                                  child: Text('Type: ${Item[index].Type.toString()}', style: kappBartxt,),),

                                  Padding(padding: EdgeInsets.only(left: 10,right: 10,),
                                    child: Text(Item[index].Calories.toString(), style: kappBartxt,),),

                                  Padding(padding: EdgeInsets.only(left: 10,right: 10,),
                                  child: Text('Price: ${Item[index].Price.toString()}',style: kappBartxt,),)],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                }
                );
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            }

        ),
      ),
    );
  }
}

  Future<List<CoffeeItems>>ReadJsonData() async{
    final jsondata = await itemBuilder.rootBundle.loadString('jsonfile/Item.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => CoffeeItems.fromJson(e)).toList();
  }

// 5:38 youtube rest api