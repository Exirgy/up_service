import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: InkWell(
              child: Icon(Icons.menu, color: Colors.black),
            ),
            iconTheme: new IconThemeData(color: Color(0xFFFFD54F)),
            floating: true,
            snap: true,
            //seethrough
            backgroundColor: Color(0xFFFFD54F),

            //shadow
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Settings",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
          ),
        ])
      ],
    ));
  }
}
