import 'package:flutter/material.dart';
import '../pages/edit_profile/edit_new_password_page.dart';
import '../pages/setting_page.dart';
import '../enum.dart';
import '../../models/mahasiswa.dart';
import '../services/api_service.dart';

class EditTitle extends StatelessWidget {
  EditTitle({
    Key? key,
    required this.title,
    required this.editPage,
    required this.user,
    required this.onAPICallProcess,
  }) : super(key: key);
  final String title;
  final EditPage editPage;
  final Mahasiswa user;
  final Function onAPICallProcess;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 100,
        // color: Colors.red,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
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
                  40, // deviceWidth - left padding - right padding - icon width -
              // color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (editPage == EditPage.name) {
                  print('edit name');
                  // update request
                  Map<String, dynamic> userUpdateRequest = {
                    'username': user.username,
                    'namaDepan': user.namaDepan,
                    'namaBelakang': user.namaBelakang,
                    'authPassword': user.password,
                    'password': user.password,
                    'confirmPassword': user.password
                  };
                  print('userUpdateRequest:');
                  print(userUpdateRequest);
                  // onAPICallProcess(true);
                  APIService.updateUser(user.id, userUpdateRequest)
                      .then((response) {
                    if (response['data'] != null) {
                      print('update success');
                      // onAPICallProcess(false);
                      Navigator.of(context).pop('Update nama berhasil');
                    }
                  });
                }

                // if (editPage == EditPage.name ||
                //     editPage == EditPage.address ||
                //     editPage == EditPage.username) {
                //   Navigator.of(context).pop();
                // } else if (editPage == EditPage.oldPassword) {
                //   Navigator.of(context)
                //       .pushNamed(EditNewPasswordPage.routeName);
                // } else if (editPage == EditPage.newPassword) {
                //   Navigator.of(context)
                //       .popUntil(ModalRoute.withName(SettingPage.routeName));
                // }
              },
              child: Image.asset(
                'assets/images/done_icon.png',
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
