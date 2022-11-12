import 'package:flutter/material.dart';
import './edit_profile/edit_name_page.dart';
import './edit_profile/edit_address_page.dart';
import './edit_profile/edit_username_page.dart';
import './edit_profile/edit_old_password_page.dart';
import '../models/mahasiswa.dart';
import '../pages/main_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    Mahasiswa user = ModalRoute.of(context)?.settings.arguments as Mahasiswa;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 35),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 100,
                // color: Colors.red,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            MainPage.routeName, (route) => false);
                      },
                      child: Image.asset(
                        'assets/images/back_icon.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Container(
                      width: deviceWidth -
                          15 -
                          15 -
                          40 -
                          30, // deviceWidth - left padding - right padding - icon width -
                      // color: Colors.yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pengaturan',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 20),
                // height: 600,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 3, color: Theme.of(context).primaryColor),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text('Ubah Nama'),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).primaryColor,
                      ),
                      onTap: () {
                        final result = Navigator.of(context)
                            .pushNamed(EditNamePage.routeName, arguments: user)
                            .then((result) {
                          if (result != null) {
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text('$result'),
                                  duration: Duration(seconds: 1),
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                              );
                          } else {
                            return;
                          }
                        });
                      },
                    ),
                    // Divider(
                    //   color: Theme.of(context).primaryColor,
                    //   thickness: 1.0,
                    // ),
                    // ListTile(
                    //   leading: Text('Ubah Lokasi'),
                    //   trailing: Icon(
                    //     Icons.keyboard_arrow_right,
                    //     color: Theme.of(context).primaryColor,
                    //   ),
                    //   onTap: () {
                    //     Navigator.of(context)
                    //         .pushNamed(EditAddressPage.routeName);
                    //   },
                    // ),
                    Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 1.0,
                    ),
                    ListTile(
                      leading: Text('Ubah Username'),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).primaryColor,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          EditUsernamePage.routeName,
                          arguments: user,
                        );
                      },
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 1.0,
                    ),
                    ListTile(
                      leading: Text('Ubah Password'),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).primaryColor,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          EditOldPasswordPage.routeName,
                          arguments: user,
                        );
                      },
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 1.0,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
