// lib/home_app_bar.dart
import 'package:flutter/material.dart';
import 'package:places/gradient_back.dart';

class HomeAppBar extends StatelessWidget {
  final String textoTitulo;

  // Constructor optimizado
  const HomeAppBar(this.textoTitulo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final titulo = Container(
      margin: const EdgeInsets.only(
        top: 45, // Ajuste para que el texto "Popular" no se pegue al borde superior
        left: 30
      ),
      child: Text(
        textoTitulo,
        style: const TextStyle(
          fontFamily: "Lato",
          fontWeight: FontWeight.w900,
          fontSize: 30,
          color: Colors.white
        ),
      ),
    );

    // 👇 LA CORRECCIÓN CLAVE 👇
    return Container(
      height: 130, // Limitamos el alto total de la barra superior
      child: Stack(
        children: <Widget>[
          // Envolvemos GradientBack en un SizedBox para obligarlo a ser una barra delgada
          // Esto rompe el escudo invisible y libera el scroll de abajo
          SizedBox(
            height: 130,
            width: double.infinity,
            child: GradientBack(), 
          ),
          titulo,
        ],
      ),
    );
  }
}