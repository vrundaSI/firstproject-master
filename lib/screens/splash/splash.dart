import 'dart:async';
import 'package:firstproject/screens/sign_up/signup.dart';
import 'package:firstproject/utils/colors.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  static String route = "SplashScreen";

  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = const Duration(seconds: 1);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "FirstProject",
              style: TextStyle(
                  color: MyColors.blue,
                  fontSize: 30,
                  ),
            ),
          ],
        ),
      ),


    );
  }
}
