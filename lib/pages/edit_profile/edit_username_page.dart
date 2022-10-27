import 'package:flutter/material.dart';
import '../../widgets/edit_title.dart';

class EditUsernamePage extends StatefulWidget {
  const EditUsernamePage({Key? key}) : super(key: key);
  static const routeName = '/editusername';

  @override
  State<EditUsernamePage> createState() => _EditUsernamePageState();
}

class _EditUsernamePageState extends State<EditUsernamePage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 35),
        child: Column(
          children: [
            EditTitle(
              title: 'Ubah Username',
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
                      'Username',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: TextFormField(
                        controller: _firstNameController..text = 'username123',
                        enableInteractiveSelection: false,
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
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
