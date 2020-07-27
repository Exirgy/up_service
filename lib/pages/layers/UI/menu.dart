import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;

  const Menu({Key key, this.slideAnimation, this.menuAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: menuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //this is where ive stored all the tabs on the menu of the app
                //including the profile avatar and the prospective logout button
                Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
                SizedBox(height: 20),
                Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
                SizedBox(height: 20),
                Text(
                  "Messages",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
                SizedBox(height: 20),
                Text(
                  "Reviews",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
                SizedBox(height: 20),
                Text(
                  "Favorites",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
                SizedBox(height: 20),
                Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
