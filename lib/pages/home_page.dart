import 'package:flutter/material.dart';
import '../widgets/result.dart';
import '../widgets/username_title.dart';
import '../services/api_service.dart';
import '../models/rekomendasi.dart';
import '../models/restoran.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.username}) : super(key: key);
  static const routeName = '/home';
  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  bool _showResult = false;
  String _inputBudget = '';
  String _inputHari = '';
  bool isLoaded = false;
  Rekomendasi? _rekomendasi;
  List<Restoran> _listRestoran = [];

  void _displayResult() {
    FocusScope.of(context).unfocus();
    setState(() {
      _showResult = true;
    });
  }

  // GET RESTORAN DATA
  void _getRestoranData(String restoId, {required bool isLastIndex}) {
    // get restoran data
    print('get restoran data...');
    APIService.getRestoran(restoId).then((restoData) {
      if (restoData != null) {
        print('resto data not null');
        print(restoData.nama);
        _listRestoran.add(restoData);

        if (isLastIndex) {
          print('listResto : ');
          print(_listRestoran);
          setState(() {
            isLoaded = true;
          });
        }
      }
    });
    print('finish get resto data');
  }

  // GET REKOMENDASI DATA
  void _getRekomendasiData() {
    setState(() {
      isLoaded = false;
    });
    // get rekomendasi data
    print('get rekomendasi data...');
    print('budget: ${_inputBudget}');
    print('hari: ${_inputHari}');
    APIService.getRekomendasi(_inputBudget, _inputHari).then((rekomendasiData) {
      print("rekomendasi data : ");
      print(rekomendasiData);
      if (rekomendasiData != null) {
        _rekomendasi = rekomendasiData;
        if (rekomendasiData.rekomendasiMakanan.isNotEmpty) {
          for (int i = 0; i < rekomendasiData.rekomendasiMakanan.length; i++) {
            if (i == rekomendasiData.rekomendasiMakanan.length - 1) {
              _getRestoranData(rekomendasiData.rekomendasiMakanan[i].restoran,
                  isLastIndex: true);
            } else {
              _getRestoranData(rekomendasiData.rekomendasiMakanan[i].restoran,
                  isLastIndex: false);
            }
          }
        } else {
          setState(() {
            isLoaded = true;
          });
        }
      }
    });
  }

  void _save() {
    final form = _globalFormKey.currentState;
    form!.save();

    print('inputBudget : ${_inputBudget}');
    print('inputHari: ${_inputHari}');

    if (_inputBudget.isNotEmpty && _inputHari.isNotEmpty) {
      _displayResult();
      _getRekomendasiData();
    } else {
      setState(() {
        _showResult = false;
      });
    }
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
                key: _globalFormKey,
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
                                onSaved: (newValue) => {
                                  _inputBudget = newValue!,
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
                                onSaved: (newValue) => {
                                  _inputHari = newValue!,
                                },
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
                        onTap: _save,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // RESULT
            if (_showResult)
              !isLoaded
                  ? CircularProgressIndicator()
                  : Result(
                      budget: _inputBudget,
                      hari: _inputHari,
                      rekomendasi: _rekomendasi,
                      listRestoran: _listRestoran,
                    )
          ],
        ),
      ),
    );
  }
}
