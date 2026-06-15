import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  //URL DEL BACKEND 
  final String baseUrl =
      "http://localhost:8080/api/v1/auth";

  Future<bool> iniciarSesion(
    String usuario,
    String contrasena,
  ) async {

    try {

      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "usuario": usuario,
          "contrasena": contrasena,
        }),
      );

      print("Status: ${response.statusCode}");
      print("Body: ${response.body}");

      if (response.statusCode == 200) {

        final data =
            jsonDecode(response.body);

        final token =
            data["token"];

        final prefs =
            await SharedPreferences.getInstance();

        await prefs.setString(
          "token",
          token,
        );

        return true;
      }

      return false;

    } catch (e) {

      print("Error login: $e");
      return false;
    }
  }

  Future<String?> obtenerToken() async {

    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getString("token");
  }

  Future<void> cerrarSesion() async {

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.remove("token");
  }
}