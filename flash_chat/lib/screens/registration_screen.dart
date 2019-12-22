import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Utilities/customizedButton.dart';
import 'package:flash_chat/Utilities/customizedTextField.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'reg_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool _showSpinner = false;
  bool _buttonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        //Modal Progress HUD is used to show spinner while firebase authenticating
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 35.0,
              ),
              Flexible(
                //this means that it should try to take up the specified space. however if space ain't available, then shrink accordingly
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              CustomizedTextField(
                colour: Colors.blueAccent,
                hintText: 'Enter your email',
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomizedTextField(
                colour: Colors.blueAccent,
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
                text: 'Register',
                colour: _buttonDisabled == false
                    ? Colors.blueAccent
                    : Colors.blueGrey,
                onPressed: () async {
                  setState(() {
                    _showSpinner = true;
                  });
                  if (_buttonDisabled == false) {
                    _buttonDisabled = true;
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      _showSpinner = false;
                    });
                    _buttonDisabled = true;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
