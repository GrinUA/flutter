import 'dart:math' as math;

import 'package:flutter/material.dart';

class ColorfulScreen extends StatefulWidget {
  @override
  _ColorfulScreenState createState() => _ColorfulScreenState();
}

class _ColorfulScreenState extends State<ColorfulScreen> {
  final String string = 'Hi There!';
  Color _backgroundColor;
  Color _textColor;
  List<Text> _letters;

  @override
  void initState() {
    super.initState();
    _letters = _getTextsFromString(string);
    _backgroundColor = getRandomColor();
    _textColor = getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          decoration: BoxDecoration(color: _backgroundColor),
          child: Center(
            child: Row(
              children: _letters,
            ),
          ),
        ),
        onTap: () => changeColors());
  }

  _getTextsFromString(String row) {
    List<Text> letters = [];
    for (int i = 0; i < row.length; i++) {
      letters.add(Text(
        row[i],
        style: TextStyle(color: getRandomColor()),
      ));
    }
    return letters;
  }

  void changeColors() {
    setState(() {
      _backgroundColor = getRandomColor();
      _textColor = getRandomColor();
      _letters = _getTextsFromString(string);
    });
  }

  Color getRandomColor() {
    var random = math.Random();
    return Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0);
  }
}
