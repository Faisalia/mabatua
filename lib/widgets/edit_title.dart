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
    this.validateOldPassword,
    this.newPassword,
    this.confirmNewPassword,
  }) : super(key: key);
  final String title;
  final EditPage editPage;
  final Mahasiswa user;
  final Function? validateOldPassword;
  final String? newPassword;
  final String? confirmNewPassword;

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
                FocusManager.instance.primaryFocus?.unfocus();
                // JIKA BERADA DI OLD PASSWORD PAGE
                if (editPage == EditPage.oldPassword) {
                  if (validateOldPassword != null) {
                    if (validateOldPassword!()) {
                      Navigator.of(context)
                          .pushNamed(
                        EditNewPasswordPage.routeName,
                        arguments: user,
                      )
                          .then((result) {
                        if (result != null) {
                          Navigator.of(context).pop(result);
                        } else {
                          return;
                        }
                      });
                    }
                  }
                  return;
                }
                print('new pass: ${newPassword}');
                print('confirm pass: ${confirmNewPassword}');
                Map<String, dynamic> userUpdateRequest = {
                  'username': user.username,
                  'namaDepan': user.namaDepan,
                  'namaBelakang': user.namaBelakang,
                  'authPassword': user.password,
                  'password': newPassword == null ? user.password : newPassword,
                  'confirmPassword': confirmNewPassword == null
                      ? user.password
                      : confirmNewPassword
                };

                // update request

                print('userUpdateRequest:');
                print(userUpdateRequest);
                // onAPICallProcess(true);
                APIService.updateUser(user.id, userUpdateRequest)
                    .then((response) {
                  if (response['data'] != null) {
                    print('update success');
                    // onAPICallProcess(false);
                    if (editPage == EditPage.name) {
                      Navigator.of(context).pop('Update nama berhasil');
                    } else if (editPage == EditPage.username) {
                      Navigator.of(context).pop('Update username berhasil');
                    } else if (editPage == EditPage.newPassword) {
                      Navigator.of(context).pop('Update password berhasil');
                    }
                  }
                });

                // if (editPage == EditPage.oldPassword) {
                //   Navigator.of(context).pushNamed(
                //     EditNewPasswordPage.routeName,
                //     arguments: user,
                //   );
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
