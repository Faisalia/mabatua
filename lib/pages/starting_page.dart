import 'package:flutter/material.dart';
import './login_page.dart';
import './register_page.dart';

class StartingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              height: 150,
              width: 150,
              child: Image.asset('assets/images/icon_savekost.png'),
            ),
            Container(
              width: 250,
              height: 200,
              child: Text(
                'SaveKost merupakan sebuah platform untuk mahasiswa IPB dalam memberikan rekomendasi pengeluaran kebutuhan makan dengan mengisi jumlah dana yang dimiliki dan rentang waktu yang diinginkan untuk diestimasi.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            // BUTTON MASUK DAN REGISTER
            Container(
              margin: EdgeInsets.only(bottom: 50, right: 20, left: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
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
                        Navigator.of(context).pushNamed(LoginPage.routeName);
                      },
                      child: Text(
                        "MASUK",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RegisterPage.routeName);
                      },
                      child: Text(
                        "DAFTAR",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
