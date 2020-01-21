import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorfulScreen extends StatefulWidget {
  @override
  _ColorfulScreenState createState() => _ColorfulScreenState();
}

class _ColorfulScreenState extends State<ColorfulScreen> {
  Color backgroundColor;
  Color textColor;

  @override
  void initState() {
    super.initState();
    backgroundColor = getRandomColor();
    textColor = getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          decoration: BoxDecoration(color: backgroundColor),
          child: Center(
            child: Text(
              'Hey there',
              style:
                  TextStyle(color: textColor, decoration: TextDecoration.none),
            ),
          ),
        ),
        onTap: () => changeColors());
  }

  void changeColors() {
    setState(() {
      backgroundColor = getRandomColor();
      textColor = getRandomColor();
    });
  }

  Color getRandomColor() {
    var random = math.Random();
    return Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0);
  }
}
