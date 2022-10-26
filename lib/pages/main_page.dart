import 'package:flutter/material.dart';
import './home_page.dart';
import './profile_page.dart';
import '../widgets/result.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List _pages = [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // debugPrint('${_currentIndex}');
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
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
