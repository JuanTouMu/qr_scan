// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ScanModel {
  ScanModel({
    this.id,
    this.tipus,
    required this.valor,
  }) {
    if (this.valor.contains('http')) {
      this.tipus = 'http';
    } else {
      this.tipus = 'geo';
    }
  }

  int? id;
  String? tipus;
  String valor;
  LatLng getLanLng() {
    final latlng = this.valor.substring(4).split(',');
    final latitud = double.parse(latlng[0]);
    final longitud = double.parse(latlng[1]);
    return LatLng(latitud, longitud);
  }

  factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipus: json["tipus"],
        valor: json["valor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipus": tipus,
        "valor": valor,
      };
}
