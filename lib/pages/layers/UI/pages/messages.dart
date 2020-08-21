import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:up_service/pages/layers/widgets/category_selector.dart';
import 'package:up_service/pages/layers/widgets/favorite_contacts.dart';
import 'package:up_service/pages/layers/widgets/recent_chats.dart';
import 'package:up_service/state/navigation.state.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  NavigationState navigationState;
  @override
  Widget build(BuildContext context) {
    navigationState = Provider.of<NavigationState>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
          onPressed: () {
            navigationState.showMenu = !navigationState.showMenu;
          },
        ),
        title: Text(
          'Chats',
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
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
