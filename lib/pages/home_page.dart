import 'package:flutter/material.dart';
import '../widgets/result.dart';
import '../widgets/username_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.username}) : super(key: key);
  static const routeName = '/home';
  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showResult = false;

  void _displayResult() {
    FocusScope.of(context).unfocus();
    setState(() {
      _showResult = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: SingleChildScrollView(
        child: Column(
          children: [
            UsernameTitle(
              username: widget.username,
            ),
            IntrinsicHeight(
              // color: Colors.green,
              // height: 150,
              // width: double.infinity,
              child: Form(
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
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'harus diisi';
                                  }
                                },
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
                              child: TextFormField(
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
                        onTap: _displayResult,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // RESULT
            if (_showResult) Result()
          ],
        ),
      ),
    );
  }
}
