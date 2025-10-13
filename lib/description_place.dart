import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final titulo = Container(
      margin: EdgeInsets.only(
        right: 20
      ),
      child: Text(
        "Duwili Ella",
        style: TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.bold
        ),
      ),
    );

    final estrella = Container(
      margin: EdgeInsets.only(
        right: 5
      ),
      child: Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );

    final estrellaBorde = Container(
      margin: EdgeInsets.only(
        right: 5
      ),
      child: Icon(
        Icons.star,
        color: Colors.black54
      ),
    );

    final filaEstrellas = Row(
      children: <Widget>[
        estrella,
        estrella,
        estrella,
        estrella,
        estrellaBorde
      ],
    );

    final filaTitulo = Row(
      children: <Widget>[
        titulo,
        filaEstrellas
      ],
    );

    final descripcion = Container(
      margin: EdgeInsets.only(
        top: 10
      ),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris odio lectus, lacinia vel congue eu, fringilla id sem. Mauris faucibus diam purus, eget tincidunt arcu vestibulum vitae. Duis non orci vitae augue sodales eleifend consequat vel massa. Suspendisse potenti. Nam nec fermentum sem, eget sodales odio. Fusce sed volutpat massa. In vehicula ut tortor in consequat. Duis bibendum ipsum quis purus faucibus, et fringilla est pulvinar. Sed laoreet non orci non bibendum. Donec rhoncus eget est quis imperdiet. Vestibulum vitae aliquet magna, nec tempus eros. Ut interdum dolor ut elit hendrerit, id porta libero consequat. Nam vulputate elit quis aliquam mollis. Praesent ornare sagittis ornare.",
        style: TextStyle(
          color: Colors.black54
        ),
      ),
    );

    final descriptionPlace = Column(
      children: <Widget>[
        filaTitulo,
        descripcion
      ],
    );

    return descriptionPlace;
  }

}