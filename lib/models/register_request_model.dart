class RegisterRequestModel {
  RegisterRequestModel({
    required this.username,
    required this.namaDepan,
    required this.namaBelakang,
    required this.password,
    required this.confirmPassword,
  });
  late final String username;
  late final String namaDepan;
  late final String namaBelakang;
  late final String password;
  late final String confirmPassword;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    namaDepan = json['namaDepan'];
    namaBelakang = json['namaBelakang'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['namaDepan'] = namaDepan;
    _data['namaBelakang'] = namaBelakang;
    _data['password'] = password;
    _data['confirmPassword'] = confirmPassword;
    return _data;
  }
}
