import 'package:flutter/material.dart';
import 'package:infocalproject/gradient_back.dart';
import 'package:infocalproject/review.dart';
import 'package:infocalproject/review_list.dart';
import 'description_place.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final descriptionPlace = Container(
      margin: EdgeInsets.only(
        top: 250,
        left: 30,
        right: 30,
      ),
      //parametros descriptionPlace
      child: DescriptionPlace("Uyuni", 1, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris odio lectus, lacinia vel congue eu, fringilla id sem. Mauris faucibus diam purus, eget tincidunt arcu vestibulum vitae. Duis non orci vitae augue sodales eleifend consequat vel massa. Suspendisse potenti. Nam nec fermentum sem, eget sodales odio. Fusce sed volutpat massa. In vehicula ut tortor in consequat. Duis bibendum ipsum quis purus faucibus, et fringilla est pulvinar. Sed laoreet non orci non bibendum. Donec rhoncus eget est quis imperdiet. Vestibulum vitae aliquet magna, nec tempus eros. Ut interdum dolor ut elit hendrerit, id porta libero consequat. Nam vulputate elit quis aliquam mollis. Praesent ornare sagittis ornare."),
    );

    final reviewList = Container(
      margin: EdgeInsets.only(
        top: 250,
        left: 30,
        right: 30,
      ),
      child: ReviewList(),
    );

    //listView

    final listView = ListView(
      children: <Widget>[
        descriptionPlace,
        reviewList
      ],
    );

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
          //descriptionPlace
          GradientBack(),
          listView
        ],
      ),
    );
  }
}