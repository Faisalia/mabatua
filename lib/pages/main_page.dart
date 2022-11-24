import 'package:flutter/material.dart';
import './home_page.dart';
import './profile_page.dart';
import '../widgets/result.dart';
import '../services/api_service.dart';
import '../models/mahasiswa.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.isFromSettingPage}) : super(key: key);
  static const routeName = '/main';
  bool isFromSettingPage;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Mahasiswa? _user;
  int _currentIndex = 0;
  bool _isDataLoaded = false;
  bool _isInitState = false;
  // List _pages = [
  //   HomePage(u),
  //   ProfilePage(),
  // ];

  void setProfileIndex() {
    _currentIndex = 1;
    print('setProfileIndex');
  }

  @override
  void initState() {
    super.initState();
    // _isInitState = true;
    _currentIndex = widget.isFromSettingPage ? 1 : 0;
    APIService.getUser().then((user) {
      if (user != null) {
        print('getUser in mainpage');
        print('user plain pass: ${user.password}');
        _user = user;
        setState(() {
          _isDataLoaded = true;
          // _isInitState = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build111');
    // final String args = ModalRoute.of(context)!.settings.arguments as String;
    // print("args : " + args);
    // debugPrint('${_currentIndex}');
    // var args = ModalRoute.of(context)?.settings.arguments
    //     as dynamic; // arguments from setting page for profile index
    // print('args: : ${args}');
    // _currentIndex =
    //     args != null ? args['tabIndex'] : (_isInitState ? 0 : _currentIndex);
    print('currentIndex ::: ${_currentIndex}');

    return Scaffold(
      extendBody: true,
      body: !_isDataLoaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _currentIndex == 0
              ? HomePage(
                  username: _user!.username,
                )
              : ProfilePage(
                  user: _user!,
                  onProfileIndex: setProfileIndex,
                ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SizedBox(
          height: 50,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              widget.isFromSettingPage = false;
              setState(() {
                _currentIndex = index;
              });
            },
            elevation: 0.0,
            selectedFontSize: 0,
            backgroundColor: Theme.of(context).primaryColor,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    height: 49,
                    width: 200,
                    decoration: BoxDecoration(
                      color: _currentIndex == 0
                          ? Theme.of(context).primaryColorDark
                          : Theme.of(context).primaryColor,
                    ),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 49,
                    width: 200,
                    decoration: BoxDecoration(
                      color: _currentIndex == 1
                          ? Theme.of(context).primaryColorDark
                          : Theme.of(context).primaryColor,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  label: 'profile'),
            ],
          ),
        ),
      ),
    );
  }
}
