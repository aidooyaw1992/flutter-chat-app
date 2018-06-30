import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'G Chat',
      routes: <String, WidgetBuilder> {
        '/Login': (BuildContext context) => new LoginPage(),
        '/ChatList': (BuildContext context) => new ChatList(), 
      },
      home: LoginPage(),
    );
  }
}