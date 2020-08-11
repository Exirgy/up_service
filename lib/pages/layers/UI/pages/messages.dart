import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFFD54F),
          leading: InkWell(
            child: Icon(Icons.menu, color: Colors.black),
          ),
          title: const Text(
            'Chats',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          elevation: 10,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Icon(Icons.refresh, color: Colors.black),
            Tooltip(message: 'refresh'),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Icon(Icons.message, color: Colors.black),
            Tooltip(message: 'inbox'),
          ]),
      body: Center(
        child: Text('You have $_count messages !'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFD54F),
        onPressed: () => setState(() {
          _count++;
        }),
        tooltip: 'Compose Message',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
