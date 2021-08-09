import 'package:flutter/material.dart';
import './my_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.grey[850], fontFamily: 'Comfortaa'),
      home: MyHomepage(),
    );
  }
}
