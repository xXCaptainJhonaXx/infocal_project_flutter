import 'package:flutter/material.dart';
import 'description_place.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("My Places"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 250,
              left: 30,
              right: 30,
            ),
            child: DescriptionPlace(),
          ),
        ],
      ),
    );
  }
}