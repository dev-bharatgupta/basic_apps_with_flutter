import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dice/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceheight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.2,
                deviceheight * 0.4, 0, 0),
            child: ThrowDice()),
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            "Dice",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class ThrowDice extends StatefulWidget {
  @override
  _ThrowDiceState createState() => _ThrowDiceState();
}

class _ThrowDiceState extends State<ThrowDice> {
  var index1 = 4;
  var index2 = 4;

  void changeindex() {
    print("asdf");
    setState(() {
      index1 = Random().nextInt(5);
      index2 = Random().nextInt(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          child: dice.dicelist[index1],
          onTap: () => changeindex(),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          child: dice.dicelist[index2],
          onTap: () {
            return changeindex();
          },
        ),
      ],
    );
  }
}
