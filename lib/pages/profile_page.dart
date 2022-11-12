import 'package:flutter/material.dart';
import '../widgets/username_title.dart';
import '../pages/setting_page.dart';
import '../services/shared_service.dart';
import '../models/mahasiswa.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  final Mahasiswa user;

  @override
  Widget build(BuildContext context) {
    final String username = user.username;
    final String namaLengkap = user.namaDepan + " " + user.namaBelakang;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: UsernameTitle(
              username: username,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            height: 600,
            decoration: BoxDecoration(
              // color: Colors.red,
              border: Border(
                top:
                    BorderSide(width: 3, color: Theme.of(context).primaryColor),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NAMA
                      Text('Nama Lengkap :'),
                      SizedBox(height: 20),
                      Text(
                        namaLengkap,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 40),
                      // ALAMAT
                      // Text('Lokasi Saya : '),
                      // SizedBox(height: 20),
                      // Text(
                      //   'Perumahan IPB Alam Sinarsari Blok A No 30 Dramaga, Kab. Bogor, Jawa Barat 16680',
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                      // )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 0.0),
                        leading: Icon(
                          Icons.settings,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text('Pengaturan'),
                        onTap: () {
                          Navigator.of(context).pushNamed(SettingPage.routeName,
                              arguments: user);
                        },
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 0.0),
                        leading: Icon(
                          Icons.logout,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text('Keluar'),
                        onTap: () {
                          SharedService.logout(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
