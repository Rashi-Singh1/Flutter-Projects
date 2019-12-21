import 'package:flash_chat/Utilities/customizedButton.dart';
import 'package:flash_chat/Utilities/customizedTextField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                colour: Colors.lightBlueAccent,
                hintText: 'Enter your Email',
                onChanged: (value) {
                  //TODO: do something with user input
                }),
            SizedBox(
              height: 8.0,
            ),
            CustomizedTextField(
              colour: Colors.lightBlueAccent,
              hintText: 'Enter your password',
              onChanged: (value) {
                //TODO: do something with user input
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            CustomizedButton(
              text: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                //TODO: Implement Login facility
              },
            ),
          ],
        ),
      ),
    );
  }
}
