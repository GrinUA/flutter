import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class ColorfulScreen extends StatefulWidget {
  @override
  _ColorfulScreenState createState() => _ColorfulScreenState();
}

class _ColorfulScreenState extends State<ColorfulScreen> {
  final int stringLength = 20;
  String string;
  List<Text> letters;
  Color backgroundColor;
  Color textColor;

  @override
  void initState() {
    super.initState();
    string = generateText(stringLength);
    letters = _getTextsFromString(string);
    backgroundColor = getRandomColor();
    textColor = getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          decoration: BoxDecoration(color: backgroundColor),
          child: Center(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: letters,
                )),
          ),
        ),
        onTap: () => changeColors());
  }

  List<Text> _getTextsFromString(String row) {
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
      backgroundColor = getRandomColor();
      textColor = getRandomColor();
      string = generateTextEasyWay(stringLength);
      letters = _getTextsFromString(string);
    });
  }

  Color getRandomColor() {
    var random = math.Random();
    return Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0);
  }

  String generateTextEasyWay(int length) => randomString(stringLength);

  String generateText(int length) {
    String string = '';
    int shift = 32;
    int lastCharacter = 127;
    for (int i = 0; i < length; i++) {
      string = String.fromCharCodes(charCodes(length, shift, lastCharacter));
    }
    return string;
  }

  Iterable<int> charCodes(int length, int start, int end) sync* {
    var random = math.Random();
    int x = 0;
    for (int i = 0; i < length; i++) {
      x = random.nextInt(end);
      if (x < start) {
        x += start;
      }
      yield x;
    }
  }
}
