import 'dart:math';
import 'package:animation_part2/animations/moving_text.dart';
import 'package:animation_part2/screens/second_screen.dart';
import 'package:flutter/material.dart';
import '../animations/slide_transition.dart';
import 'hero_screen.dart';

//начальный экран проиложения

class FirstScreen extends StatefulWidget{
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with TickerProviderStateMixin {

  late AnimationController _controllerOpacity;
  late Animation<double> _animationOpacity;

  late AnimationController _controllerRotation = AnimationController(
    vsync: this,
    duration: Duration(seconds: 5),
  )
    ..repeat();

  @override
  void initState() {
    _controllerOpacity = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animationOpacity = Tween(begin: 0.0, end: 1.0).animate(_controllerOpacity);
    _controllerOpacity.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controllerRotation.dispose();
    _controllerOpacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Another animations'),
        ),
        body: Center(child: Column(
          children: [
            AnimatedBuilder(
              animation: _controllerRotation,
              child: FadeTransition(
                opacity: _animationOpacity,
                child: Image.asset('images/tiger.png', scale: 4,),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controllerRotation.value * 2.0 * pi,
                  child: child,
                );
              },
            ),
            MovingText(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    FadeTransition(
                      opacity: _animationOpacity,
                      child: Hero(
                          tag: 'donkey',
                          child: Image.asset('images/donkey.png', scale: 7,)
                      ),
                    ),
                    SizedBox(width: 20.0,),
                       OutlinedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HeroScreen()
                        ));
                      },
                      child: Text('Bigger picture'),
                    )
                  ],
                ),
              ),
            ),

            OutlinedButton(
              onPressed: () {
                Navigator.push(context, SliderRoute(page: SecondScreen()));
              },
              child: Text('To the second screen'),
            ),
          ],
        ))
    );
  }
}