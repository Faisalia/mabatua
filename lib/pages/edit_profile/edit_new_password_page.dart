import 'package:flutter/material.dart';
import 'package:local_savekost/enum.dart';
import '../../widgets/edit_title.dart';
import '../../models/mahasiswa.dart';

class EditNewPasswordPage extends StatefulWidget {
  const EditNewPasswordPage({Key? key}) : super(key: key);
  static const routeName = '/edit-new-password';

  @override
  State<EditNewPasswordPage> createState() => _EditNewPasswordPageState();
}

class _EditNewPasswordPageState extends State<EditNewPasswordPage> {
  // TextEditingController _passwordController = TextEditingController();
  // TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  var _isAPICall = false;

  void _togglevisibility({bool isConfirm: false}) {
    setState(() {
      if (isConfirm) {
        _obscureTextConfirm = !_obscureTextConfirm;
      } else {
        _obscureText = !_obscureText;
      }
    });
  }

  void _apiCall(bool isAPICall) {
    setState(() {
      _isAPICall = isAPICall;
    });
  }

  @override
  Widget build(BuildContext context) {
    Mahasiswa user = ModalRoute.of(context)?.settings.arguments as Mahasiswa;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 35),
        child: Column(
          children: [
            EditTitle(
              title: 'Ubah Password',
              editPage: EditPage.newPassword,
              user: user,
              onAPICallProcess: _apiCall,
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              // height: 600,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 3, color: Theme.of(context).primaryColor),
                ),
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buat Password Baru',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: TextFormField(
                        // controller: _firstNameController..text = 'Faisal',
                        obscureText: _obscureText,
                        enableInteractiveSelection: false,
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () =>
                                _togglevisibility(isConfirm: false),
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          // hintText: 'Faisal',
                          hintStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                          fillColor: Theme.of(context).primaryColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Konfirmasi Password Baru',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: TextFormField(
                        // controller: _lastNameController..text = 'Keren',
                        obscureText: _obscureTextConfirm,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () => _togglevisibility(isConfirm: true),
                            icon: Icon(
                              _obscureTextConfirm
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          border: OutlineInputBorder(),
                          // hintText: 'Keren',
                          hintStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                          fillColor: Theme.of(context).primaryColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
