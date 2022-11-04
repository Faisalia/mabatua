import 'package:flutter/material.dart';
import '../pages/register_page.dart';
import '../pages/main_page.dart';
import '../models/login_request_model.dart';
import '../services/api_service.dart';
import '../pages/main_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isAPICallProcess = false;
  bool _obscureText = true;
  void _togglevisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  String? _username = '';
  String? _password = '';
  // String? _errorMsg;

  String? _onValidate(String? value, String type) {
    if (type == 'username') {
      if (value!.isEmpty) {
        return 'Harus diisi !';
      }
      return null;
    } else if (type == 'password') {
      if (value!.isEmpty) {
        return 'Harus diisi!';
      }
      return null;
    }
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        contentTextStyle: TextStyle(color: Colors.black),
        title: Text('Error Message'),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return _isAPICallProcess
        ? CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
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
                          onPressed: _togglevisibility,
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

                            LoginRequestModel model = LoginRequestModel(
                              username: _username!,
                              password: _password!,
                            );

                            APIService.login(model).then((response) {
                              setState(() {
                                _isAPICallProcess = false;
                              });

                              if (response) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  MainPage.routeName,
                                  (route) => false,
                                );
                              } else {
                                print('invalid username/password');
                                _showErrorDialog("Wrong username/password");
                              }
                            });
                          }
                          // Navigator.of(context).pushNamed(MainPage.routeName);
                        },
                        child: Text('MASUK'),
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
                        Navigator.of(context).pushNamed(RegisterPage.routeName);
                      },
                      child: Text(
                        'Belum punya akun ?',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          );
  }
}
