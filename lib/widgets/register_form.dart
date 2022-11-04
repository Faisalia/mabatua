import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../models/register_request_model.dart';
import '../services/api_service.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isAPICallProcess = false;
  GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureTextConfirm = true;

  String? _username = '';
  String? _namaDepan = '';
  String? _namaBelakang = '';
  String? _password = '';
  String? _confirmPassword = '';

  void _togglevisibility({bool isConfirm = false}) {
    setState(() {
      if (isConfirm) {
        _obscureTextConfirm = !_obscureTextConfirm;
      } else {
        _obscureText = !_obscureText;
      }
    });
  }

  String? _onValidate(String? value, String type) {
    if (value!.isEmpty) {
      return 'Harus diisi !';
    }
    return null;
  }

  bool _validateAndSave() {
    // var iserror = _globalFormKey.currentState!.validate();
    // print('isError');
    // print(iserror);
    final form = _globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void _showAlertDialog(String message, {required bool isSuccess}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        contentTextStyle: TextStyle(color: Colors.black),
        title: isSuccess ? Text('Success Message') : Text("Error Message"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: isSuccess
                ? () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginPage.routeName,
                      (route) => false,
                    );
                  }
                : () {
                    Navigator.of(context).pop();
                  },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: _isAPICallProcess
          ? CircularProgressIndicator()
          : Form(
              key: _globalFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 40,
                    child: TextFormField(
                      validator: (val) => _onValidate(val!, 'username'),
                      onSaved: (val) => {_username = val},
                      decoration: InputDecoration(
                        // errorText: _errorMsg,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(),
                        hintText: 'Masukkan username',
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                        fillColor: Theme.of(context).primaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Depan',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // height: 40,
                            width: 165,
                            child: TextFormField(
                              validator: (val) =>
                                  _onValidate(val!, 'Nama Depan'),
                              onSaved: (val) => {_namaDepan = val},
                              decoration: InputDecoration(
                                // errorText: _errorMsg,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(),
                                hintText: 'Masukkan nama depan',
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
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Belakang',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            // height: 40,
                            width: 180,
                            child: TextFormField(
                              validator: (val) =>
                                  _onValidate(val!, 'Nama Belakang'),
                              onSaved: (val) => {_namaBelakang = val},
                              decoration: InputDecoration(
                                // errorText: _errorMsg,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(),
                                hintText: 'Masukkan nama belakang',
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
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2),
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
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 40,
                    child: TextFormField(
                      validator: (val) => _onValidate(val!, 'password'),
                      onSaved: (val) => {_password = val},
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        suffixIcon: IconButton(
                          onPressed: () => _togglevisibility(isConfirm: false),
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Masukkan password',
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                        fillColor: Theme.of(context).primaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Konfirmasi Password',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 40,
                    child: TextFormField(
                      validator: (val) =>
                          _onValidate(val!, 'konfirmasi password'),
                      onSaved: (val) => {_confirmPassword = val},
                      obscureText: _obscureTextConfirm,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        suffixIcon: IconButton(
                          onPressed: () => _togglevisibility(isConfirm: true),
                          icon: Icon(
                            _obscureTextConfirm
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Masukkan kembali password',
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                        fillColor: Theme.of(context).primaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_validateAndSave()) {
                            setState(() {
                              _isAPICallProcess = true;
                            });

                            RegisterRequestModel model = RegisterRequestModel(
                              username: _username!,
                              namaDepan: _namaDepan!,
                              namaBelakang: _namaBelakang!,
                              password: _password!,
                              confirmPassword: _confirmPassword!,
                            );

                            APIService.register(model).then((response) {
                              setState(() {
                                _isAPICallProcess = false;
                              });

                              if (response["data"] != null) {
                                _showAlertDialog(
                                  "Registrasi berhasil ! Silahkan login.",
                                  isSuccess: true,
                                );
                              } else {
                                print('error register');
                                _showAlertDialog(
                                  response["message"],
                                  isSuccess: false,
                                );
                              }
                            });
                          }
                        },
                        child: Text('DAFTAR'),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15)),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginPage.routeName);
                      },
                      child: Text(
                        'Sudah punya akun ?',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
    );
  }
}
