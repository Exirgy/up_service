import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:up_service/functions/algolia_application.dart';

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

class Dashboard extends StatefulWidget {
  final bool isCollapsed;
  final double screenWidth;
  final Duration duration;
  final Animation<double> scaleAnimation;
  final Function onMenuTap;
  const Dashboard({
    Key key,
    this.isCollapsed,
    this.screenWidth,
    this.duration,
    this.scaleAnimation,
    this.onMenuTap,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Algolia _algoliaApp = AlgoliaApplication.algolia;
  String _searchTerm;

  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    AlgoliaQuery query = _algoliaApp.instance.index("Posts").search(input);
    AlgoliaQuerySnapshot querySnap = await query.getObjects();
    List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.duration,
      top: 0,
      bottom: 0,
      left: widget.isCollapsed ? 0 : 0.6 * widget.screenWidth,
      right: widget.isCollapsed ? 0 : -0.2 * widget.screenWidth,
      child: ScaleTransition(
        scale: widget.scaleAnimation,
        child: Material(
          animationDuration: widget.duration,
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
                          onTap: widget.onMenuTap,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                        Icon(Icons.history, color: Colors.black),
                      ]),
                  Container(
                    height: 600,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.2),
                      scrollDirection: Axis.vertical,
                      pageSnapping: true,
                      children: <Widget>[
                        //textfield here
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}