import 'package:flutter/material.dart';
import '../widgets/username_title.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: UsernameTitle(),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            height: 600,
            decoration: BoxDecoration(
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
                        'Faisal Ibrahim Abusalam',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 40),
                      // ALAMAT
                      Text('Lokasi Saya : '),
                      SizedBox(height: 20),
                      Text(
                        'Perumahan IPB Alam Sinarsari Blok A No 30 Dramaga, Kab. Bogor, Jawa Barat 16680',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
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
                        onTap: () {},
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
                        onTap: () {},
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
