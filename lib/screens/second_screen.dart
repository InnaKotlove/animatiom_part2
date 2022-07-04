import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: Text('Another Screen',
      style: TextStyle(color: Colors.white,
      fontSize: (40)),),
      backgroundColor: Colors.grey,

    );
  }
}