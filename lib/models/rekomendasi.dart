// To parse this JSON data, do
//
//     final rekomendasi = rekomendasiFromJson(jsonString);

import 'dart:convert';

Rekomendasi rekomendasiFromJson(String str) =>
    Rekomendasi.fromJson(json.decode(str));

String rekomendasiToJson(Rekomendasi data) => json.encode(data.toJson());

class Rekomendasi {
  Rekomendasi({
    required this.rekomendasiPengeluaranPerMakanan,
    required this.rekomendasiMakanan,
  });

  int rekomendasiPengeluaranPerMakanan;
  List<RekomendasiMakanan> rekomendasiMakanan;

  factory Rekomendasi.fromJson(Map<String, dynamic> json) => Rekomendasi(
        rekomendasiPengeluaranPerMakanan:
            json["rekomendasiPengeluaranPerMakanan"],
        rekomendasiMakanan: List<RekomendasiMakanan>.from(
            json["rekomendasiMakanan"]
                .map((x) => RekomendasiMakanan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rekomendasiPengeluaranPerMakanan": rekomendasiPengeluaranPerMakanan,
        "rekomendasiMakanan":
            List<dynamic>.from(rekomendasiMakanan.map((x) => x.toJson())),
      };
}

class RekomendasiMakanan {
  RekomendasiMakanan({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.restoran,
    this.v,
  });

  String id;
  String nama;
  int harga;
  String deskripsi;
  String restoran;
  int? v;

  factory RekomendasiMakanan.fromJson(Map<String, dynamic> json) =>
      RekomendasiMakanan(
        id: json["_id"],
        nama: json["nama"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        restoran: json["restoran"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nama": nama,
        "harga": harga,
        "deskripsi": deskripsi,
        "restoran": restoran,
        "__v": v,
      };
}
