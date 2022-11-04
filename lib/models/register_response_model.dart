import 'dart:convert';

RegisterResponseModel registerResponseJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel({
    required this.namaDepan,
    required this.namaBelakang,
    required this.username,
    required this.password,
    required this.id,
    required this.V,
  });
  late final String namaDepan;
  late final String namaBelakang;
  late final String username;
  late final String password;
  late final String id;
  late final int V;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    namaDepan = json['namaDepan'];
    namaBelakang = json['namaBelakang'];
    username = json['username'];
    password = json['password'];
    id = json['_id'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['namaDepan'] = namaDepan;
    _data['namaBelakang'] = namaBelakang;
    _data['username'] = username;
    _data['password'] = password;
    _data['_id'] = id;
    _data['__v'] = V;
    return _data;
  }
}
