// lib/card_image.dart
import 'package:flutter/material.dart';
import 'package:places/fab_green.dart'; // 

class CardImage extends StatelessWidget {
  final String path;

  // Constructor corregido
  CardImage(this.path); // 

  @override
  Widget build(BuildContext context) {
    // 👇 DETECTAMOS SI EL PATH ES UNA URL DE INTERNET O UN ASSET LOCAL 👇
    final ImageProvider imageProvider = path.startsWith('http')
        ? NetworkImage(path) // Si empieza con http, la descarga de internet
        : AssetImage(path) as ImageProvider; // Si no, la busca en tus carpetas locales [cite: 18]

    final card = Padding(
      padding: const EdgeInsets.only(top: 100, right: 15, bottom: 30), // [cite: 17]
      child: Container(
        width: 200, // [cite: 17]
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider, // 👈 Ahora usa el proveedor inteligente
            fit: BoxFit.cover, // [cite: 18]
          ),
          shape: BoxShape.rectangle, // [cite: 18]
          borderRadius: const BorderRadius.all(Radius.circular(15)), // [cite: 18]
          boxShadow: const <BoxShadow>[ // [cite: 19]
            BoxShadow(
              color: Colors.black45, // [cite: 19]
              blurRadius: 15, // [cite: 19]
              offset: Offset(0, 10), // [cite: 19]
            )
          ],
        ),
      ),
    );

    final cardImage = Stack(
      alignment: const Alignment(0.7, 0.9), // [cite: 21]
      children: <Widget>[
        card, // [cite: 21]
        FabGreen() // [cite: 21]
      ],
    );

    return cardImage; // [cite: 22]
  }
}