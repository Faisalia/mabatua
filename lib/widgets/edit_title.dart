import 'package:flutter/material.dart';

class EditTitle extends StatelessWidget {
  EditTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 100,
        // color: Colors.red,
        child: Row(
          children: [
            Image.asset(
              'assets/images/back_icon.png',
              width: 40,
              height: 40,
            ),
            Container(
              width: deviceWidth -
                  15 -
                  15 -
                  40 -
                  40, // deviceWidth - left padding - right padding - icon width -
              // color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/done_icon.png',
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
