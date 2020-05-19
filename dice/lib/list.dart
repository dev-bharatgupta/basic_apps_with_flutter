import 'package:flutter/material.dart';

class dice {
  static List<Widget> _dicelist = [
    Container(
      height: 100,
      width: 100,
      decoration:
          BoxDecoration(border: Border.all(width: 4, color: Colors.yellow)),
      child: Center(
        child: CircleAvatar(
          radius: 8,
          backgroundColor: Colors.yellow,
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.all(2),
      height: 100,
      width: 100,
      decoration:
          BoxDecoration(border: Border.all(width: 4, color: Colors.yellow)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
//              SizedBox(
//                width: 1,
//              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
//          Padding(
//            child: CircleAvatar(
//              radius: 8,
//              backgroundColor: Colors.yellow,
//            ),
//            padding: EdgeInsets.only(bottom: 6,right: 6),
//          ),
//          Center(
//            child: CircleAvatar(
//              radius: 8,
//              backgroundColor: Colors.yellow,
//            ),
//          ),
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(2),
      height: 100,
      width: 100,
      decoration:
          BoxDecoration(border: Border.all(width: 4, color: Colors.yellow)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
//              SizedBox(
//                width: 1,
//              )
            ],
          ),
          Center(
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.yellow,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
//          Padding(
//            child: CircleAvatar(
//              radius: 8,
//              backgroundColor: Colors.yellow,
//            ),
//            padding: EdgeInsets.only(bottom: 6,right: 6),
//          ),
//          Center(
//            child: CircleAvatar(
//              radius: 8,
//              backgroundColor: Colors.yellow,
//            ),
//          ),
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(2),
      height: 100,
      width: 100,
      decoration:
      BoxDecoration(border: Border.all(width: 4, color: Colors.yellow)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
//          Padding(
//            child: CircleAvatar(
//              radius: 8,
//              backgroundColor: Colors.yellow,
//            ),
//            padding: EdgeInsets.only(bottom: 6,right: 6),
//          ),
//          Center(
//            child: CircleAvatar(
//              radius: 8,
//              backgroundColor: Colors.yellow,
//            ),
//          ),
        ],
      ),
    ),

    Container(
      padding: EdgeInsets.all(2),
      height: 100,
      width: 100,
      decoration:
          BoxDecoration(border: Border.all(width: 4, color: Colors.yellow)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
          Center(
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.yellow,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
//          Padding(
//            child: CircleAvatar(
//              radius: 8,
//              backgroundColor: Colors.yellow,
//            ),
//            padding: EdgeInsets.only(bottom: 6,right: 6),
//          ),
//          Center(
//            child: CircleAvatar(
//              radius: 8,
//              backgroundColor: Colors.yellow,
//            ),
//          ),
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(2),
      height: 100,
      width: 100,
      decoration:
      BoxDecoration(border: Border.all(width: 4, color: Colors.yellow)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
//          Padding(
//            child: CircleAvatar(
//              radius: 8,
//              backgroundColor: Colors.yellow,
//            ),
//            padding: EdgeInsets.only(bottom: 6,right: 6),
//          ),
//          Center(
//            child: CircleAvatar(
//              radius: 8,
//              backgroundColor: Colors.yellow,
//            ),
//          ),
        ],
      ),
    ),
  ];

  static List<Widget> get dicelist {
    return [..._dicelist];
  }
}
