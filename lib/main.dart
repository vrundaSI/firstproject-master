import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/screens/sign_up/signup.dart';
import 'package:firstproject/screens/splash/splash.dart';
import 'package:firstproject/screens/todoey/todoey_homepage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        SplashScreen.route : (context) => SplashScreen(),
        SignUp.route : (context) => SignUp(),
        toDoEyHome.route :(context)=>toDoEyHome()


      },
    );
  }
}


