import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  //adding the word static makes it a class-wide variable, so that we won't have to make an object instance to see its value
  //therefore, now can directly use it as WelcomeScreen.id (poori class ki id)
  //also, if we want some entity to be const, it must have static modifier in front of it, as const entity must be affiliated to class and not objects (bcs otherwise to object pe dependent, hence variable hoga)
  //Functions can be static too in a similar way, to use function without needing the object later (for class wide functions)

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //we can associate a class with various properties using 'with', for ex : it is acting as a tickerProvider in this case

  AnimationController controller;

  @override
  void initState() {
    super.initState();

    //initialize AnimationController controller in initState
    controller = new AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 100.0, //for the controller.value
    );

    //takes animation forward (starts it from animation value, by default the minValue)
    controller.forward();

    //to listen to the animation value, as it updates
    controller.addListener(() {
      //need to add this setState, so that if we are using the controller value to change some property, build is called again
      setState(() {});

      //by default the value range is 0-1
      print(controller.value);
    });
  }

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
            Row(
              children: <Widget>[
                Hero(
                  //the tag should be same for the corresponding Hero in the next screen
                  tag: 'logo',
                  child: Container(
                    //this is the shared image with the next screen, so use hero animation
                    child: Image.asset('images/logo.png'),
                    height: controller.value,
                  ),
                ),
                Text(
                  '${controller.value.toInt()}%',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
