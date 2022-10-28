import 'package:flutter/material.dart';
import 'package:local_savekost/widgets/food_card.dart';
import '../pages/food_list_page.dart';
import '../models/Foods.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _foods = foods;
    return Container(
      padding: EdgeInsets.only(top: 10),
      // color: Colors.blue,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rekomendasi pengeluaran'),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      children: [
                    TextSpan(
                      text: 'Rp10.000',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' / makan',
                    ),
                  ]))
            ],
          ),
          SizedBox(height: 10),
          Text('Rekomendasi makanan yang cocok'),
          SizedBox(height: 20),
          Container(
            // height: 400,
            // color: Colors.pink,
            child: Column(children: [
              FoodCard(
                foodName: _foods[0]['nama'],
                foodPrice: _foods[0]['harga'],
                loc: _foods[0]['lokasi'],
              ),
              FoodCard(
                foodName: _foods[1]['nama'],
                foodPrice: _foods[1]['harga'],
                loc: _foods[1]['lokasi'],
              ),
              FoodCard(
                foodName: _foods[2]['nama'],
                foodPrice: _foods[2]['harga'],
                loc: _foods[2]['lokasi'],
              ),
            ]),
          ),
          Container(
            width: double.infinity,
            height: 40,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Theme.of(context).primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(FoodListPage.routeName);
              },
              child: Text(
                "LIHAT LAINNYA",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
