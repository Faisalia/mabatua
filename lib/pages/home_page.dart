import 'package:flutter/material.dart';
import '../widgets/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    debugPrint('${_currentIndex}');
    return Scaffold(
      extendBody: true,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                // color: Colors.red,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icon_savekost.png',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 15),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                            children: [
                          TextSpan(
                            text: 'Hai, ',
                          ),
                          TextSpan(
                              text: 'Username !',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ]))
                  ],
                ),
              ),
              IntrinsicHeight(
                // color: Colors.green,
                // height: 150,
                // width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 75,
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 30),
                                  hintText: 'Masukkan jumlah uang (Rp)',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 75,
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 2),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 30),
                                  hintText: 'Masukkan jumlah hari',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 43),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          // height: double.infinity,
                          child: Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                            size: 64,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              // RESULT
              Result()
            ],
          ),
        ),
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
