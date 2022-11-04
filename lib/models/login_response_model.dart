import 'dart:convert';
import './mahasiswa.dart';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.mahasiswa,
  });
  late final Mahasiswa mahasiswa;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    mahasiswa = Mahasiswa.fromJson(json['mahasiswa']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mahasiswa'] = mahasiswa.toJson();
    return _data;
  }
}
