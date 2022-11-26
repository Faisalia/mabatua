import 'package:flutter/material.dart';
import 'package:local_savekost/widgets/food_card.dart';
import '../pages/food_list_page.dart';
import '../models/rekomendasi.dart';
import '../services/api_service.dart';
import '../models/restoran.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.budget,
    required this.hari,
    this.rekomendasi,
  }) : super(key: key);
  final String budget;
  final String hari;
  final Rekomendasi? rekomendasi;
  // final List<Restoran> listRestoran;

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> _foods = foods;
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
                      text: '${rekomendasi!.rekomendasiPengeluaranPerMakanan}',
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

          ListView.builder(
            padding: EdgeInsets.only(top: 0),
            shrinkWrap: true,
            itemCount: (rekomendasi?.rekomendasiMakanan)!.length > 3
                ? 3
                : rekomendasi?.rekomendasiMakanan.length,
            itemBuilder: (BuildContext context, int index) {
              return FoodCard(
                jarak: rekomendasi!.rekomendasiMakanan[index].restoran.jarak,
                foodId: rekomendasi!.rekomendasiMakanan[index].id,
                foodName: rekomendasi!.rekomendasiMakanan[index].nama,
                foodPrice: rekomendasi!.rekomendasiMakanan[index].harga,
                loc: rekomendasi!.rekomendasiMakanan[index].restoran.nama,
                deskripsi: rekomendasi!.rekomendasiMakanan[index].deskripsi,
              );
            },
          ),
          // Tampilkan tombol lainnya jika jumlah rekomendasi makanan lebih dari 3
          if (rekomendasi!.rekomendasiMakanan.length > 3)
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
                  Navigator.of(context).pushNamed(
                    FoodListPage.routeName,
                    arguments: {
                      'rekomendasiPengeluaran':
                          rekomendasi?.rekomendasiPengeluaranPerMakanan,
                      'rekomendasiMakanan': rekomendasi?.rekomendasiMakanan,
                      // 'listRestoran': listRestoran
                    },
                  );
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
