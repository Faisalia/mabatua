import 'dart:convert';

Mahasiswa mahasiswaFromJson(String str) => Mahasiswa.fromJson(json.decode(str));

String mahasiswaToJson(Mahasiswa data) => json.encode(data.toJson());

class Mahasiswa {
  Mahasiswa({
    required this.id,
    required this.namaDepan,
    required this.namaBelakang,
    required this.username,
    required this.password,
    this.V,
  });
  String id;
  String namaDepan;
  String namaBelakang;
  String username;
  String password;
  int? V;

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        id: json['_id'],
        namaDepan: json['namaDepan'],
        namaBelakang: json['namaBelakang'],
        username: json['username'],
        password: json['password'],
        V: json['__v'],
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['namaDepan'] = namaDepan;
    _data['namaBelakang'] = namaBelakang;
    _data['username'] = username;
    _data['password'] = password;
    _data['__v'] = V;
    return _data;
  }
}
