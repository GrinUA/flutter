import 'package:flutter/material.dart';
import 'package:uvarov_demo/screens/colorful/colorful_screen.dart';
import 'package:uvarov_demo/screens/github/github_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenCounter;

  List<Widget> screenBodies;

  @override
  void initState() {
    screenCounter = 0;
    super.initState();
    screenBodies = <Widget>[ColorfulScreen(), GithubScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: screenBodies[screenCounter],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenCounter,
        onTap: (int screen) {
          setState(() {
            screenCounter = screen;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('ColorFul')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Git Finder'))
        ],
      ),
    );
  }
}
