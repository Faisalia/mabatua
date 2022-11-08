import 'package:flutter/material.dart';

class FoodDescPage extends StatelessWidget {
  const FoodDescPage({Key? key}) : super(key: key);
  static const routeName = '/food-desc';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(args);

    return Scaffold(
      body: Container(
        height: double.infinity,
        // color: Colors.yellow,
        padding: EdgeInsets.only(left: 15, right: 15, top: 55),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
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
                    const SizedBox(width: 45),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.my_library_books_outlined,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            args['nama'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
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
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              Container(
                // color: Colors.red,
                // height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      // color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.discount,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Rp${args['harga']}',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      // color: Colors.yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 30,
                          ),
                          Container(
                            child: Flexible(
                              child: Text(
                                args['lokasi'],
                                style: TextStyle(fontSize: 14),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  // color: Colors.red,
                  border: Border(
                    top: BorderSide(
                        width: 1, color: Theme.of(context).primaryColor),
                  ),
                ),
                height: 450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deskripsi',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            args['deskripsi'],
                            style: TextStyle(
                                height: 1.5,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('300 m'),
                      ),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(50),
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
