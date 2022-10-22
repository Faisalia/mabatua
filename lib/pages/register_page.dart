import 'package:flutter/material.dart';
import '../widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                height: 150,
                width: 150,
                child: Image.asset('assets/images/icon_savekost.png'),
              ),
              SizedBox(
                height: 50,
              ),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
