// To parse this JSON data, do
//
//     final restoran = restoranFromJson(jsonString);

import 'dart:convert';

List<Restoran> restoranFromJson(String str) =>
    List<Restoran>.from(json.decode(str).map((x) => Restoran.fromJson(x)));

String restoranToJson(List<Restoran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restoran {
  Restoran({
    required this.id,
    required this.nama,
    required this.jarak,
    this.v,
  });

  String id;
  String nama;
  int jarak;
  int? v;

  factory Restoran.fromJson(Map<String, dynamic> json) => Restoran(
        id: json["_id"],
        nama: json["nama"],
        jarak: json["jarak"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nama": nama,
        "jarak": jarak,
        "__v": v,
      };
}
