import 'package:flutter/material.dart';
import 'package:infocalproject/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //review list
    final reviewList = Column(
      children: <Widget>[
        Review(
            "assets/images/pexels-sulimansallehi-1704488.jpg",
            "Maria Elena",
            "1 reviews - 3 photos",
            2,
            "Buen lugar para visitar."
        ),
        Review(
            "assets/images/foto1.jpeg",
            "Jeffrey Dahmer",
            "4 reviews - 3 photos",
            3,
            "Bonito Lugar."
        ),
        Review(
            "assets/images/foto2.jpeg",
            "Tedd Bundy",
            "2 reviews - 6 photos",
            4,
            "Tiene buenas vistas."
        ),
        Review(
            "assets/images/foto3.jpeg",
            "Jeffrey Epstein",
            "5 reviews - 3 photos",
            2,
            "Ire con mis hijos la proxima."
        ),
        Review(
            "assets/images/foto4.jpeg",
            "P. Diddy",
            "1 reviews - 3 photos",
            2,
            "Buen lugar para fiestas."
        ),
        Review(
            "assets/images/foto5.jpeg",
            "Bill Cosby",
            "2 reviews - 3 photos",
            2,
            "Ire con mi esposa."
        ),
      ],
    );
    return reviewList;
  }

}