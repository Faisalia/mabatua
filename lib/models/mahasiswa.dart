class Mahasiswa {
  Mahasiswa({
    required this.id,
    required this.namaDepan,
    required this.namaBelakang,
    required this.username,
    required this.password,
    required this.V,
  });
  late final String id;
  late final String namaDepan;
  late final String namaBelakang;
  late final String username;
  late final String password;
  late final int V;

  Mahasiswa.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    namaDepan = json['namaDepan'];
    namaBelakang = json['namaBelakang'];
    username = json['username'];
    password = json['password'];
    V = json['__v'];
  }

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
