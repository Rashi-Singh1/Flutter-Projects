import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Utilities/customizedButton.dart';
import 'package:flash_chat/Utilities/customizedTextField.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  bool _showSpinner = false;
  bool _enableButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 75.0,
                ),
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                CustomizedTextField(
                  colour: Colors.lightBlueAccent,
                  hintText: 'Enter your Email',
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 8.0,
                ),
                CustomizedTextField(
                  colour: Colors.lightBlueAccent,
                  hintText: 'Enter your password',
                  onChanged: (value) {
                    password = value;
                  },
                  obscured: true,
                ),
                SizedBox(
                  height: 24.0,
                ),
                CustomizedButton(
                  text: 'Log In',
                  colour:
                      _enableButton ? Colors.lightBlueAccent : Colors.blueGrey,
                  onPressed: () async {
                    setState(() {
                      _showSpinner = true;
                    });
                    if (_enableButton == true) {
                      _enableButton = false;
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null)
                          Navigator.pushNamed(context, ChatScreen.id);
                      } catch (e) {
                        print(e);
                      }
                      _enableButton = true;
                    }
                    setState(() {
                      _showSpinner = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
