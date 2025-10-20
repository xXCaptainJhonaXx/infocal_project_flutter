import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  String pathPhoto;
  String textoNombreUsuario;
  String textoResumenUsuario;
  int cantidadEstrella;
  String textoComentario;

  Review(this.pathPhoto, this.textoNombreUsuario, this.textoResumenUsuario, this.cantidadEstrella, this.textoComentario);


  @override
  Widget build(BuildContext context) {
    //review
    final foto = Container(
      margin: EdgeInsets.only(
        top: 10,
        right: 10
      ),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(
                pathPhoto
            ),
          fit: BoxFit.cover
        ),
      ),
    );


    //NOMBRE DE USUARIO
    final nombreUsuario = Container(
      child: Text(
          textoNombreUsuario,
          style: TextStyle(
            fontFamily: "Lato",
            fontSize: 20
        ),
      ),
    );

    //RESUMEN USUARIO
    final resumenUsuario = Container(
      margin: EdgeInsets.only(
        right: 10,
      ),
      child: Text(
          textoResumenUsuario,
        style: TextStyle(
          color: Colors.black54,
          fontFamily: "Lato"
        ),
      ),
    );

    //fila estrella
    final estrella = Container(
      margin: EdgeInsets.only(
          right: 5
      ),
      child: Icon(
        Icons.star,
        color: Colors.amber,
        size: 18,
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

    //fila estrella

    List<Container> estrellas = [];
    for (int i = 0; i < 5; i++) {
      if (i < cantidadEstrella) {
        estrellas.add(estrella);
      } else {
        estrellas.add(estrellaBorde);
      }
    }


    final filaEstrellas = Row(
      children: estrellas,
    );

    //FILA RESUMEN
    final filaResumen = Row(
      children: <Widget>[
        resumenUsuario, filaEstrellas

      ],
    );

    //COMENTARIO
    
    final comentario = Container(
      child: Text(
          textoComentario,
          style: TextStyle(
            fontFamily: "Lato"
          ),
      ),
    );

    //COLUMNA REVIEW
    final columnaReview = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        nombreUsuario,
        filaResumen,
        comentario
      ],
    );


    final review = Row(
      children: <Widget>[
        foto, columnaReview
      ],
    );

    return review;
  }
}