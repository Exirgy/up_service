import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/message_database..dart';
import '../../../../models/message_model.dart';
import '../../../../models/user_model.dart';
import '../../../../state/navigation.state.dart';
import '../../widgets/messages_page/category_selector.dart';
import '../../widgets/messages_page/favorite_contacts.dart';
import '../../widgets/messages_page/groups.dart';
import '../../widgets/messages_page/message_search.dart';
import '../../widgets/messages_page/online.dart';
import '../../widgets/messages_page/recent_chats.dart';
import '../../widgets/messages_page/requests.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  NavigationState navigationState;
  PageController _pageController;
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController =
      new TextEditingController();
  QuerySnapshot searchResultSnapshot;
  bool _IsSearching;

  Duration pageChanging =
      Duration(milliseconds: 300); //this is for page animation-not necessary

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  QuerySnapshot searchSnapshot;
  initiateSearch() {
    databaseMethods
        .getUserByUsername(searchTextEditingController.text)
        .then((val) {
      searchSnapshot = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    navigationState = Provider.of<NavigationState>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              navigationState.showMenu = !navigationState.showMenu;
              log(navigationState.showMenu.toString());
            },
            child: Icon(Icons.menu, color: Colors.black),
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
            TextField(
                //here i want to switch to another search page when initiate search is called
                controller: searchTextEditingController,
                onChanged: (val) {
                  initiateSearch();
                },
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: 'find user',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: const Icon(Icons.search, color: Colors.black))),
            FavoriteContacts(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: PageView(
                  //how do i put dependecy injection here so that these page are in  line with when the widgets above are  clicked?
                  children: <Widget>[
                    RecentChats(),
                    MessagesSearch(),
                    OnlineScreen(),
                    GroupScreen(),
                    RequestScreen(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

//below is the chat screen
//on modification the chat room id will be  swapped with the user data model to change the title of the chat screen to the user id

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({Key key, this.user}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        //icon for hearting smns message
        IconButton(
            icon: message.isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            iconSize: 30.0,
            color: message.isLiked ? Colors.red : Colors.blueGrey,
            onPressed: () {})
      ],
    );
  }

//the textfield function
  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
              child: TextField(
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {},
            decoration:
                InputDecoration.collapsed(hintText: 'Send a message...'),
          )),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () {})
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      }),
                ),
              ),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}
