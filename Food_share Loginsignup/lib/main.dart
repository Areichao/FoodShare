import 'package:flutter/material.dart';
import 'package:helloworld/Screens/Welcome/welcome_screen.dart';
import 'package:helloworld/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodshare Login/sign up',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      // A widget which will be started on application startup
      home: WelcomeScreen(),
    );
  }
}
