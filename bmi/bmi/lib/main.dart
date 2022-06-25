import 'package:bmi/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xFF566de5),
            scaffoldBackgroundColor: Color(0xffb9d6f3)
        ), home: MainScreen() );

  }
}

