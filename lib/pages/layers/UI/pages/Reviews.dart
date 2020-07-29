import 'package:flutter/material.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD54F),
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(Icons.menu, color: Colors.black),
        ),
        title: const Text(
          'Reviews',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        elevation: 10,
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
    );
  }
}
