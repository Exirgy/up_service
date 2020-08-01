import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int _count = 0;
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
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
