import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                child: Image.asset('assets/images/icon_savekost.png'),
              ),
              SizedBox(
                height: 100,
              ),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
