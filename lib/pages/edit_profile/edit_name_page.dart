import 'package:flutter/material.dart';
import 'package:local_savekost/enum.dart';
import '../../widgets/edit_title.dart';
import '../../models/mahasiswa.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({Key? key}) : super(key: key);
  static const routeName = '/editname';

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  Mahasiswa? _user;
  var _isAPICall = false;

  void _onChangeFirstName() {
    print('FirstName text field: ${_firstNameController.text}');
    _user?.namaDepan = _firstNameController.text;
  }

  void _onChangeLastName() {
    print('LastName text field: ${_lastNameController.text}');
    _user?.namaBelakang = _lastNameController.text;
  }

  void _apiCall(bool isAPICall) {
    setState(() {
      _isAPICall = isAPICall;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameController.addListener(_onChangeFirstName);
    _lastNameController.addListener(_onChangeLastName);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Mahasiswa userArgs =
        ModalRoute.of(context)?.settings.arguments as Mahasiswa;
    _user = userArgs;

    return Scaffold(
      body: _isAPICall
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 35),
              child: Column(
                children: [
                  EditTitle(
                      title: 'Ubah Nama',
                      editPage: EditPage.name,
                      user: _user!,
                      onAPICallProcess: _apiCall),
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
                            'Nama Depan',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: TextFormField(
                              controller: _firstNameController
                                ..text = _user!.namaDepan,
                              enableInteractiveSelection: false,
                              focusNode: FocusNode(),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
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
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Nama Belakang',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: TextFormField(
                              controller: _lastNameController
                                ..text = _user!.namaBelakang,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(),
                                // hintText: 'Keren',
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
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(50),
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
