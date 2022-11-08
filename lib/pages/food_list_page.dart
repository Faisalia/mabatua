import 'package:flutter/material.dart';
import '../widgets/result.dart';
import '../widgets/recommendation_title.dart';
import '../widgets/food_card.dart';
import '../models/Foods.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);
  static const routeName = '/food-list';

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final List<Map<String, dynamic>> _foods = foods;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
      extendBody: true,
      body: Container(
        height: double.infinity,
        // color: Colors.yellow,
        padding: EdgeInsets.only(left: 15, right: 15, top: 55),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RecommendationTitle(),
              Container(
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
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
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
                    // SizedBox(height: 10),
                    // Text('Rekomendasi makanan yang cocok'),
                    SizedBox(height: 20),
                    Container(
                      // color: Colors.pink,
                      height: deviceHeight -
                          20 -
                          16 -
                          10 -
                          50 -
                          55, // deviceHeight - sizedbox - fontsize - paddingTop - iconback_height - paddingtop
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 0),
                        shrinkWrap: true,
                        itemCount: _foods.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FoodCard(
                            foodName: _foods[index]['nama'],
                            foodPrice: _foods[index]['harga'],
                            loc: _foods[index]['lokasi'],
                            deskripsi: _foods[index]['deskripsi'],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
