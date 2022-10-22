import 'package:flutter/material.dart';
import '../pages/login_page.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  void _togglevisibility({bool isConfirm: false}) {
    setState(() {
      if (isConfirm) {
        _obscureTextConfirm = !_obscureTextConfirm;
      } else {
        _obscureText = !_obscureText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
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
              height: 40,
              child: TextFormField(
                enableInteractiveSelection: false,
                focusNode: FocusNode(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 165,
                      height: 40,
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 180,
                      height: 40,
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
              height: 40,
              child: TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  suffixIcon: IconButton(
                    onPressed: () => _togglevisibility(isConfirm: false),
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
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
              height: 40,
              child: TextFormField(
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
                  onPressed: () {},
                  child: Text('DAFTAR'),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
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
