import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/Utilities/customizedButton.dart';
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
  Animation animation;
  //till now the value of the controller.value was approx linear, animation would be a layer over this controller to use CurvedAnimation

  @override
  void initState() {
    super.initState();

    //initialize AnimationController controller in initState
    controller = new AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    //IMP: upperbound for curved animations must be 1
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    //similarly can have diff types of tweens like BorderRadiusTween, AlignmentTween, ConstantTween etc

    //takes animation forward (starts it from animation value, by default the minValue)
    controller.forward();

    //can use reverse to use reverse of animation
    //controller.reverse(from: 1.0);

    //to listen to the animation value, as it updates
    controller.addListener(() {
      //need to add this setState, so that if we are using the controller value to change some property, build is called again
      setState(() {});
    });
  }

  @override
  void dispose() {
    //controller stays in mem if not disposed, hogging the resources
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
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
                    height: 60.0,
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  child: TypewriterAnimatedTextKit(
                    text: ['Flash Chat'],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            CustomizedButton(
              text: 'Log In',
              onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
              colour: Colors.lightBlueAccent,
            ),
            CustomizedButton(
              text: 'Register',
              onPressed: () =>
                  Navigator.pushNamed(context, RegistrationScreen.id),
              colour: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
