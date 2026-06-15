// lib/home.dart

import 'package:flutter/material.dart';
import 'package:places/card_image_list.dart'; // 👈 Importamos tu componente modularizado
import 'package:places/home_app_bar.dart';
import 'package:places/review_list.dart';
import 'description_place.dart';
import 'services/lugar_service.dart';        
import 'models/lugar_model.dart';           

class MyHome extends StatelessWidget {
  final LugarService _lugarService = LugarService(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<LugarModel>>(
        future: _lugarService.listarLugares(), // Consumimos el endpoint GET
        builder: (context, snapshot) {
          
          // 1. Mientras la API responde, mostramos un indicador de carga circular
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          // 2. Si ocurre un error de red o servidor apagado, lo muestra en pantalla de forma segura
          if (snapshot.hasError) {
            return Center(child: Text("Error al cargar datos: ${snapshot.error}"));
          }

          // 3. Si la base de datos de PostgreSQL está vacía
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay lugares registrados en la BD"));
          }

          // 4. Obtenemos la LISTA COMPLETA de lugares mapeados desde tu Spring Boot
          final listaLugares = snapshot.data!;

          // Tomamos el primer lugar de la lista para renderizar su texto abajo
          final lugarSeleccionado = listaLugares.first;

          // 5. LLAMAMOS A TU COMPONENTE PASÁNDOLE LA LISTA DINÁMICA DE LA BD
          // Esto inyecta los datos en lib/card_image_list.dart y elimina los fantasmas estáticos
          final cardImageList = CardImageList(lugares: listaLugares);

          // Contenedor de Título, estrellas y descripción dinámica de la Base de Datos
          final descriptionPlace = Container(
            margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: DescriptionPlace(
              lugarSeleccionado.nombre,       // Dinámico desde la BD (Coroico)
              5,                              // Puntuación por defecto
              lugarSeleccionado.descripcion,  // Dinámica desde la BD
            ),
          );

          // Contenedor de la lista de reseñas
          final reviewList = Container(
            margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: ReviewList(), 
          );

          final listView = ListView(
            padding: EdgeInsets.zero, // Importante: Quita paddings por defecto
            children: <Widget>[
              cardImageList,    // 1. Las imágenes dinámicas (La salchicha, Coroico, etc.)
              descriptionPlace, // 2. Título y estrellas
              reviewList,       // 3. Reseñas
            ],
          );

          // 👇 AQUÍ SE DEFINE EL LOOK VISUAL 👇
          return Stack(
            children: <Widget>[
              // Capa 1 (FONDO TOTAL): El bloque morado con el título "Popular"
              HomeAppBar("Popular"), 
              
              // Capa 2 (AL FRENTE ABSOLUTO): Tu lista con el carrusel de imágenes
              // Al estar arriba, el scroll horizontal y el botón verde reciben tus clics directamente.
              listView, 
            ],
          );
        },
      ),
    );
  }
}