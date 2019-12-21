import 'package:flash_chat/Utilities/customizedButton.dart';
import 'package:flash_chat/Utilities/customizedTextField.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'reg_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
              colour: Colors.blueAccent,
              hintText: 'Enter your email',
              onChanged: (value) {
                //TODO: do something with user input
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            CustomizedTextField(
              colour: Colors.blueAccent,
              hintText: 'Enter your password',
              onChanged: (value) {
                //TODO: do something with user input
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            CustomizedButton(
              text: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                //TODO: Implement Registration facility
              },
            ),
          ],
        ),
      ),
    );
  }
}
