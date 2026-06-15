// lib/card_image_list.dart
import 'package:flutter/material.dart';
import 'card_image.dart';
import 'models/lugar_model.dart'; 

class CardImageList extends StatelessWidget {
  final List<LugarModel> lugares;

  const CardImageList({Key? key, required this.lugares}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lugares.length,
        itemBuilder: (context, index) {
          return CardImage(lugares[index].url);
        },
      ),
    );
  }
}