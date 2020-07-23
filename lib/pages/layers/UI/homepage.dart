import 'package:flutter/material.dart';
import 'dart:async';
import 'package:algolia/algolia.dart';
import 'package:up_service/pages/functions/algolia_application.dart';

final Color backgroundColor = Color(0xFFFFD54F);

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Algolia _algoliaApp = AlgoliaApplication.algolia;
  String _searchTerm;
  final Duration duration = const Duration(milliseconds: 500);
  //below line scales the contents on the dashboard just incase the top measurements exceeds the screen scale
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuscaleAnimation;
  Animation<Offset> _slideAnimation;
  //animation for the menu contents above

  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    AlgoliaQuery query = _algoliaApp.instance.index("services").search(input);
    AlgoliaQuerySnapshot querySnap = await query.getObjects();
    List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuscaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    //wrap the padding with a slide Transition which takes a pos slide animation
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuscaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Search",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "Categories",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "Messages",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "Reviews",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "Favorites",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "Settings",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          child: Icon(Icons.menu, color: Colors.black),
                          onTap: () {
                            setState(() {
                              if (isCollapsed)
                                _controller.forward();
                              else
                                _controller.reverse();
                              isCollapsed = !isCollapsed;
                            });
                          },
                        ),
                        Text(
                          'Search',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                        Icon(Icons.remove_from_queue, color: Colors.black),
                      ]),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        TextField(
                            onChanged: (val) {
                              setState(() {
                                _searchTerm = val;
                              });
                            },
                            style: new TextStyle(
                                color: Colors.black, fontSize: 20),
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search ...',
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: const Icon(Icons.search,
                                    color: Colors.black))),
                        StreamBuilder<List<AlgoliaObjectSnapshot>>(
                          stream: Stream.fromFuture(_operation(_searchTerm)),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Text(
                                "Start Typing",
                                style: TextStyle(color: Colors.black),
                              );
                            else {
                              List<AlgoliaObjectSnapshot> currSearchStuff =
                                  snapshot.data;

                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Container();
                                default:
                                  if (snapshot.hasError)
                                    return new Text('Error: ${snapshot.error}');
                                  else
                                    return CustomScrollView(
                                      shrinkWrap: true,
                                      slivers: <Widget>[
                                        SliverList(
                                          delegate: SliverChildBuilderDelegate(
                                            (context, index) {
                                              return _searchTerm.length > 0
                                                  ? DisplaySearchResult(
                                                      bio:
                                                          currSearchStuff[index]
                                                              .data["bio"],
                                                      companyName:
                                                          currSearchStuff[index]
                                                                  .data[
                                                              "company_name"],
                                                      location:
                                                          currSearchStuff[index]
                                                              .data["location"],
                                                    )
                                                  : Container();
                                            },
                                            childCount:
                                                currSearchStuff.length ?? 0,
                                          ),
                                        ),
                                      ],
                                    );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Search here",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Company'),
                          subtitle: Text('Loacation'),
                          trailing: Text('service type'),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 16,
                        );
                      },
                      itemCount: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DisplaySearchResult extends StatelessWidget {
  final String bio;
  final String companyName;
  final String location;

  DisplaySearchResult({Key key, this.companyName, this.bio, this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        bio ?? "",
        style: TextStyle(color: Colors.black),
      ),
      Text(
        companyName ?? "",
        style: TextStyle(color: Colors.black),
      ),
      Text(
        location ?? "",
        style: TextStyle(color: Colors.black),
      ),
      Divider(
        color: Colors.black,
      ),
      SizedBox(height: 20)
    ]);
  }
}
