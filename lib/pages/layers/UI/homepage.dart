import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
        ],
      ),
    );
  }
}

Widget menu(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Dashboard",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              "Messages",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              "Forms",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              "Blog",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ]),
    ),
  );
}
