// lib/models/lugar_model.dart

class LugarModel {
  final int? idLugares;
  final String nombre;
  final String descripcion;
  final String provincia;
  final String direccion;
  final double longitud;
  final double latitud;
  final String municipio;
  final String departamento;
  final String url;

  LugarModel({
    this.idLugares,
    required this.nombre,
    required this.descripcion,
    required this.provincia,
    required this.direccion,
    required this.longitud,
    required this.latitud,
    required this.municipio,
    required this.departamento,
    required this.url,
  });

  // Convierte un JSON del Backend (Spring Boot) a un objeto de Flutter
  factory LugarModel.fromJson(Map<String, dynamic> json) {
    return LugarModel(
      idLugares: json['idLugares'],
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      provincia: json['provincia'] ?? '',
      direccion: json['direccion'] ?? '',
      longitud: (json['longitud'] as num?)?.toDouble() ?? 0.0,
      latitud: (json['latitud'] as num?)?.toDouble() ?? 0.0,
      municipio: json['municipio'] ?? '',
      departamento: json['departamento'] ?? '',
      url: json['url'] ?? '',
    );
  }

  // Convierte el objeto de Flutter a JSON para enviarlo en el POST
  Map<String, dynamic> toJson() {
    return {
      if (idLugares != null) 'idLugares': idLugares,
      'nombre': nombre,
      'descripcion': descripcion,
      'provincia': provincia,
      'direccion': direccion,
      'longitud': longitud,
      'latitud': latitud,
      'municipio': municipio,
      'departamento': departamento,
      'url': url,
    };
  }
}