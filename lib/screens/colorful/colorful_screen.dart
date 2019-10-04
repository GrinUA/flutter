import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorfulScreen extends StatefulWidget {
  @override
  _ColorfulScreenState createState() => _ColorfulScreenState();
}

class _ColorfulScreenState extends State<ColorfulScreen> {
  Color backgroundColor;

  @override
  void initState() {
    super.initState();
    backgroundColor = getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(color: backgroundColor),
              child: Center(
                child: Text('Hey there'),
              ),
            ),
            onTap: () => setBackgroundColor(getRandomColor())));
  }

  void setBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  Color getRandomColor() {
    var random = math.Random();
    return Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0);
  }
}
