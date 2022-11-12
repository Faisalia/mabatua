import 'package:flutter/material.dart';
import '../../widgets/edit_title.dart';
import '../../enum.dart';
import '../../models/mahasiswa.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({Key? key}) : super(key: key);
  static const routeName = '/editaddress';

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  TextEditingController _addressController = TextEditingController();
  var _isAPICall = false;

  void _apiCall(bool isAPICall) {
    setState(() {
      _isAPICall = isAPICall;
    });
  }

  @override
  Widget build(BuildContext context) {
    Mahasiswa user = ModalRoute.of(context)?.settings.arguments as Mahasiswa;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 35),
        child: Column(
          children: [
            EditTitle(
              title: 'Ubah Alamat',
              editPage: EditPage.address,
              user: user,
              onAPICallProcess: _apiCall,
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              // height: 600,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 3, color: Theme.of(context).primaryColor),
                ),
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alamat',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // height: 40,
                      child: TextFormField(
                        maxLines: 3,
                        controller: _addressController
                          ..text =
                              'Perumahan IPB Alam Sinarsari Blok A No 30 Dramaga, Kab. Bogor, Jawa Barat 16680',
                        enableInteractiveSelection: false,
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          // hintText: 'Faisal',
                          hintStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                          fillColor: Theme.of(context).primaryColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
