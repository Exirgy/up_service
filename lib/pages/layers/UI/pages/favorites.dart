import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFD54F),
        onPressed: () => setState(() {}),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
