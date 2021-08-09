import 'package:flutter/material.dart';
import './my_bodywidget.dart';

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      backgroundColor: Colors.white,
      body: MyBodywidget(),
    );
  }
}
