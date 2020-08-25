import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:up_service/state/navigation.state.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key key}) : super(key: key);

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  NavigationState navigationState;
  @override
  Widget build(BuildContext context) {
    navigationState = Provider.of<NavigationState>(context);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () {
                navigationState.showMenu = !navigationState.showMenu;
                log(navigationState.showMenu.toString());
              },
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
                "Reviews",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Icon(Icons.refresh, color: Colors.black),
              Tooltip(message: 'refresh'),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Icon(Icons.notifications, color: Colors.black),
              Tooltip(message: 'click here to check your notifications'),
            ],
          ),
        ])
      ],
    ));
  }
}
