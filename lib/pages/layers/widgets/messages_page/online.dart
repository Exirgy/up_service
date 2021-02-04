import 'package:flutter/material.dart';
import 'package:up_service/models/message_model.dart';
import 'package:up_service/pages/layers/views/pages/messages.dart';

class OnlineScreen extends StatelessWidget {
  const OnlineScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
                  itemCount: chats.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message chat = chats[index];
                    return GestureDetector(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChatScreen(
                                  user: chat.sender,
                                ),
                              ),
                            ),
                        child: Container(
                            margin: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: 20.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            //Unread mesage color
                            decoration: BoxDecoration(
                                color: chat.unread
                                    ? Color(0xFFFFEFEE)
                                    : Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                )),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[])));
                  }))),
    );
  }
}
