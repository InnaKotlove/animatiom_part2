import 'package:flutter/material.dart';

//экран для перехода с Hero анимацией

class HeroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero screen'),
      ),
      body: Hero(
        tag: 'horse',
        child: Image.asset('images/donkey.png'),
      ),
    );
  }
}