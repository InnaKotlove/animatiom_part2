import 'package:flutter/material.dart';

class MovingText extends StatefulWidget {
  const MovingText({Key? key}) : super(key: key);

  @override
  State<MovingText> createState() => _MovingTextState();
}

class _MovingTextState extends State<MovingText> with TickerProviderStateMixin {
  late AnimationController _controllerArrow;

  late AnimationController _controllerDropDown = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );
  late Animation<double> _animationDropDown = CurvedAnimation(
    parent: _controllerDropDown,
    curve: Curves.easeIn,
  );

  bool _dropDownShow = false;

  @override
  void initState() {
    _controllerArrow =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    super.initState();
  }

  @override
  void dispose() {
    _controllerDropDown.dispose();
    _controllerArrow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
          child: ListTile(
        title: Text('Press arrow'),
        trailing: GestureDetector(
          child: RotationTransition(
              turns: Tween(begin: 0.0, end: -0.5).animate(_controllerArrow),
              child: Icon(Icons.arrow_upward)),
          onTap: () {
            if (_dropDownShow == false) {
              _controllerDropDown.forward();
              _controllerArrow.forward();
              _dropDownShow = true;
            } else {
              _controllerDropDown.reverse();
              _controllerArrow.reverse();
              _dropDownShow = false;
            }
          },
        ),
      )),
      SizeTransition(
          sizeFactor: _animationDropDown,
          axis: Axis.vertical,
          axisAlignment: -1,
          child: Card(
              child: ListTile(
            title: Text('''
tiger-
Type: Friendly tiger
Color:Yellow and black
'''),
          )))
    ]);
  }
}
