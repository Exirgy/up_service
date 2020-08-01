import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_sign_in/google_sign_in.dart';
import 'package:up_service/state/user.state.dart';

class Menu extends StatefulWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;

  const Menu({Key key, this.slideAnimation, this.menuAnimation})
      : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  UserState userState;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.slideAnimation,
      child: ScaleTransition(
        scale: widget.menuAnimation,
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
                ListTile(
                  leading:
                      GoogleUserCircleAvatar(identity: userState.googleAccount),
                  title: Text(userState.user.displayName ?? ''),
                  subtitle: Text(userState.user.email ?? ''),
                ),
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
