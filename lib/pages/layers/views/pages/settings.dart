import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:up_service/state/user.state.dart';
import 'package:up_service/state/app.state.dart';
import 'package:up_service/state/navigation.state.dart';
import 'package:up_service/utils/constants.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab();

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  NavigationState navigationState;
  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);
    final userState = Provider.of<UserState>(context);
    final navigationState = Provider.of<NavigationState>(context);

    Future<void> _signOut() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Logout?'),
            elevation: 0,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure you want to logout?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                color: Colors.red[900],
                child: Text('Logout'),
                onPressed: () {
                  userState.handleSignOut();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            navigationState.showMenu = !navigationState.showMenu;
            log(navigationState.showMenu.toString());
          },
          child: Icon(Icons.menu, color: Colors.black),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () {})
        ],
      ),
      body: Column(children: [
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Observer(
              builder: (_) {
                return Text(
                  '${appState.appName} ${appState.version}+${appState.buildNumber}',
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                );
              },
            ),
          ),
        )
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[200],
        shape: const CircularNotchedRectangle(),
        child: MaterialButton(
          textColor: Colors.white,
          padding: EdgeInsets.all(20.0),
          onPressed: () => _signOut(),
          child: Text('LogOut'),
        ),
      ),
    );
  }
}
