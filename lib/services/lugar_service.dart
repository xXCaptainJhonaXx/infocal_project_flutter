// lib/services/lugar_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/lugar_model.dart';

class LugarService {
  // Cambia 'localhost' por '10.0.2.2' si estás probando en emulador de Android
  final String baseUrl = "http://localhost:8080/api/v1/lugares";

  // 1. MÉTODO GET: Traer todos los lugares de la Base de Datos
  Future<List<LugarModel>> listarLugares() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        // Al estar usando UTF-8 evitamos que se rompan las tildes o la 'ñ'
        List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
        return body.map((item) => LugarModel.fromJson(item)).toList();
      } else {
        throw Exception("Error al obtener lugares del servidor");
      }
    } catch (e) {
      throw Exception("Error de conexión: $e");
    }
  }

  // 2. MÉTODO POST: Enviar un nuevo lugar (recibe el DTO plano de Dart)
  Future<LugarModel> crearLugar(LugarModel nuevoLugar) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(nuevoLugar.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return LugarModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        throw Exception("Error al guardar el lugar en el backend");
      }
    } catch (e) {
      throw Exception("Error de conexión al enviar POST: $e");
    }
  }
}