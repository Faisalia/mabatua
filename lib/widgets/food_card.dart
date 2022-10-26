import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Theme.of(context).primaryColor,
              // color: Colors.blue,

              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/food.png'),
              ),
            ),
            width: 100,
            height: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            // color: Colors.green,
            height: 100,
            width: deviceWidth -
                15 -
                15 -
                100 -
                10, // dikurang padding parent, width image. dan sizebox width
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Row(
                            children: [
                              Icon(Icons.my_library_books_outlined),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Cah Kangkung',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                        Divider(color: Theme.of(context).primaryColor),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Row(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.discount),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Rp10.000',
                                      style: TextStyle(fontSize: 10),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Alvin Jaya',
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '300',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          'm',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
