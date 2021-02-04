import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:up_service/models/message_database..dart';
import 'package:up_service/models/message_model.dart';
import 'package:up_service/pages/layers/views/pages/messages.dart';
import 'package:up_service/state/user.state.dart';

class MessagesSearch extends StatefulWidget {
  const MessagesSearch({Key key}) : super(key: key);

  @override
  _MessagesSearchState createState() => _MessagesSearchState();
}

class _MessagesSearchState extends State<MessagesSearch> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  QuerySnapshot searchResultSnapshot;
  TextEditingController searchTextEditingController =
      new TextEditingController();

  QuerySnapshot searchSnapshot;
  initiateSearch() {
    databaseMethods
        .getUserByUsername(searchTextEditingController.text)
        .then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return searchSnapshot != null
        ? Container(
            height: 300.0,
            decoration: BoxDecoration(
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
                    itemCount: searchSnapshot.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      //final Message chat = chats[index];
                      return SearchTile(
                        userName: searchSnapshot.documents[index].data['name'],
                        userEmail:
                            searchSnapshot.documents[index].data['email'],
                      );
                    })))
        : Container();
  }
}

class SearchTile extends StatelessWidget {
  const SearchTile({Key key, this.userName, this.userEmail}) : super(key: key);
  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                userName,
              ),
              Text(userEmail),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Icon(
              Icons.message,
              color: Colors.blueGrey,
            ),
          )
        ],
      ),
    );
  }
}
