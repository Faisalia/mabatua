import 'package:flutter/material.dart';
import './pages/starting_page.dart';
import './pages/login_page.dart';
import './pages/register_page.dart';
import './pages/home_page.dart';
import './pages/main_page.dart';
import './pages/setting_page.dart';
import './pages/edit_profile/edit_name_page.dart';
import './pages/edit_profile/edit_address_page.dart';
import './pages/edit_profile/edit_username_page.dart';
import './pages/edit_profile/edit_new_password_page.dart';
import './pages/edit_profile/edit_old_password_page.dart';
import './pages/food_list_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaveKost',
      theme: ThemeData(
        primaryColor: Color(0xFF118EEB),
        primaryColorDark: Color(0xFF0172C6),
        iconTheme: IconThemeData(
          color: Color(0xFF118EEB),
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color(0xFF118EEB),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Color(0xFF118EEB)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Color(0xFF118EEB),
          ),
        ),
      ),
      home: StartingPage(),
      routes: {
        LoginPage.routeName: ((context) => LoginPage()),
        RegisterPage.routeName: (context) => RegisterPage(),
        MainPage.routeName: (context) => MainPage(),
        SettingPage.routeName: (context) => SettingPage(),
        EditNamePage.routeName: (context) => EditNamePage(),
        EditAddressPage.routeName: (context) => EditAddressPage(),
        EditUsernamePage.routeName: (context) => EditUsernamePage(),
        EditOldPasswordPage.routeName: (context) => EditOldPasswordPage(),
        EditNewPasswordPage.routeName: (context) => EditNewPasswordPage(),
        FoodListPage.routeName: (context) => FoodListPage()
      },
    );
  }
}
