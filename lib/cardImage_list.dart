import 'package:flutter/material.dart';
import 'package:infocalproject/cardImage.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //card
    final cardImageList = Container(
      height: 330,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("assets/images/lugar1.jpg"),
          CardImage("assets/images/lugar2.jpg"),
          CardImage("assets/images/lugar3.jpg"),
          CardImage("assets/images/lugar4.jpg"),
          CardImage("assets/images/lugar5.jpeg"),
        ],
      ),
    );

    return cardImageList;
  }

}