import 'package:flutter/material.dart';

class UsernameTitle extends StatelessWidget {
  const UsernameTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      // color: Colors.red,
      child: Row(
        children: [
          Image.asset(
            'assets/images/savekost_username.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 15),
          RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 18),
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
    );
  }
}
