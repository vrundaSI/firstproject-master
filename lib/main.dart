import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/screens/sign_up/signup.dart';
import 'package:firstproject/screens/splash/splash.dart';
import 'package:firstproject/screens/todoey/todoey_homepage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
      home: const SplashScreen(),
      routes: {
        SplashScreen.route : (context) => const SplashScreen(),
        SignUp.route : (context) => const SignUp(),
        ToDoEyHome.route :(context)=>const ToDoEyHome()


      },
    );
  }
}


