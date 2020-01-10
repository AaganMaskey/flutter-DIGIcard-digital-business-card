import 'package:digicard/screens/home_screen.dart';
import 'package:digicard/screens/login_screen.dart';
import 'package:digicard/screens/registration_screen.dart';
import 'package:digicard/sidemenu_screens/mycard_page.dart';
import 'package:flutter/material.dart';

final startColor = Color(0xFFaa7ce4);
final endColor = Color(0xFFe46792);
final titleColor = Color(0xff444444);
final textColor = Color(0xFFa9a9a9);
final shadowColor = Color(0xffe9e9f4);
final backColor = Color(0xffff0266);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: backColor,
      ),
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new RegistrationScreen(),
        '/homepage': (BuildContext context) => HomeScreen(),
        '/mycard': (BuildContext context) => new Mycard(),
      },
    );
  }
}
