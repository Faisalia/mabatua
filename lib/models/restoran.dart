// To parse this JSON data, do
//
//     final restoran = restoranFromJson(jsonString);

import 'dart:convert';

Restoran restoranFromJson(String str) => Restoran.fromJson(json.decode(str));

String restoranToJson(Restoran data) => json.encode(data.toJson());

class Restoran {
  Restoran({
    required this.id,
    required this.nama,
    this.v,
  });

  String id;
  String nama;
  int? v;

  factory Restoran.fromJson(Map<String, dynamic> json) => Restoran(
        id: json["_id"],
        nama: json["nama"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nama": nama,
        "__v": v,
      };
}
