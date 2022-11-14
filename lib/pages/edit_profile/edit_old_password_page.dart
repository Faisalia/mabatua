import 'package:flutter/material.dart';
import 'package:local_savekost/enum.dart';
import '../../widgets/edit_title.dart';
import '../../models/mahasiswa.dart';

class EditOldPasswordPage extends StatefulWidget {
  const EditOldPasswordPage({Key? key}) : super(key: key);
  static const routeName = '/edit-old-password';

  @override
  State<EditOldPasswordPage> createState() => _EditOldPasswordPageState();
}

class _EditOldPasswordPageState extends State<EditOldPasswordPage> {
  TextEditingController _oldPasswordController = TextEditingController();
  GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  Mahasiswa? _user;

  bool _obscureText = true;
  var _isAPICall = false;
  void _togglevisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? _onValidate(String value) {
    print('value: ${value}');
    if (value.isEmpty) {
      return 'Password harus diisi';
    } else if (value != _user!.password) {
      return 'Password yang anda masukkan salah';
    }
  }

  bool? validateAndSave() {
    var form = _globalFormKey.currentState;
    bool isValid = form!.validate();
    if (isValid) {
      debugPrint('valid in validateAndSave old pass');
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Mahasiswa userArgs =
        ModalRoute.of(context)?.settings.arguments as Mahasiswa;
    _user = userArgs;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 35),
        child: Column(
          children: [
            EditTitle(
              title: 'Ubah Password',
              editPage: EditPage.oldPassword,
              user: _user!,
              validateOldPassword: validateAndSave,
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
                key: _globalFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Masukkan Password yang Lama',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextFormField(
                        validator: (value) => _onValidate(value!),
                        onSaved: (value) => _user!.password = value!,
                        obscureText: _obscureText,
                        controller: _oldPasswordController,
                        enableInteractiveSelection: false,
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: _togglevisibility,
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
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
