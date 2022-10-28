import 'package:flutter/material.dart';

class RecommendationTitle extends StatelessWidget {
  const RecommendationTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 100,
      // color: Colors.red,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              'assets/images/back_icon.png',
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(width: 15),
          RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 18),
                  children: [
                TextSpan(
                    text: 'Makanan Rekomendasi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ]))
        ],
      ),
    );
  }
}
