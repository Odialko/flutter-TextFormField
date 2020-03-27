import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FocusNode _focusMember = FocusNode();

  var _membershipController = TextEditingController();

  @override
  void dispose() {
    _membershipController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _membershipController.addListener(() => setState(() => {}));
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 150.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 3.0, left: 10.0),
                        child: _focusMember.hasFocus
                            ? Text(
                                'labelText',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16.0),
                              )
                            : Text(''),
                      ),
                      TextFormField(
                        focusNode: _focusMember,
                        controller: _membershipController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(
                              bottom: 20.0, top: 20.0, left: 10.0),
                          fillColor: Colors.greenAccent,
                          labelText: 'labelText',
                          hasFloatingPlaceholder: false,
                          enabled: true,
                          labelStyle: TextStyle(
                              color: _focusMember.hasFocus
                                  ? Colors.blue
                                  : Colors.white),
                          helperText: 'helperText',
                          helperStyle: TextStyle(
                              color: _focusMember.hasFocus == true
                                  ? Colors.blue
                                  : Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
//                              gapPadding: 40.0,
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          focusColor: Colors.green,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
