import 'dart:developer';

import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:up_service/functions/algolia_application.dart';
import 'package:up_service/pages/layers/views/pages/Reviews.dart';
import 'dart:async';

import 'package:up_service/state/navigation.state.dart';

class DisplaySearchResult extends StatelessWidget {
  final String bio;
  final String companyName;
  final List<dynamic> location;

  DisplaySearchResult({Key key, this.bio, this.companyName, this.location})
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
        location.toString() ?? "",
        style: TextStyle(color: Colors.black),
      ),
      Divider(
        color: Colors.black,
      ),
      SizedBox(height: 20)
    ]);
  }
}

class SearchPage extends StatefulWidget {
  final Function onMenuTap;
  const SearchPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Algolia _algoliaApp = AlgoliaApplication.algolia;
  String _searchTerm;
  NavigationState navigationState;

  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    AlgoliaQuery query = _algoliaApp.instance.index("services").search(input);
    AlgoliaQuerySnapshot querySnap = await query.getObjects();
    List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  @override
  Widget build(BuildContext context) {
    navigationState = Provider.of<NavigationState>(context);
    return SingleChildScrollView(
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
                        navigationState.showMenu = !navigationState.showMenu;
                        log(navigationState.showMenu.toString());
                      }),
                  Text(
                    'Search',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  Icon(Icons.history, color: Colors.black),
                  //Tooltip(message: 'history'),
                ]),
            SizedBox(
              height: 20.0,
            ),
            TextField(
                onChanged: (val) {
                  setState(() {
                    _searchTerm = val;
                  });
                },
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search ...',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: const Icon(Icons.search, color: Colors.black))),
            StreamBuilder<List<AlgoliaObjectSnapshot>>(
              stream: Stream.fromFuture(_operation(_searchTerm)),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Text(
                    "Start Typing",
                    style: TextStyle(color: Colors.black),
                  );
                else {
                  List<AlgoliaObjectSnapshot> currSearchStuff = snapshot.data;

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
                                      ? GestureDetector(
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => ReviewsPage()),
                                          ),
                                          child: DisplaySearchResult(
                                            bio: currSearchStuff[index]
                                                .data["bio"],
                                            companyName: currSearchStuff[index]
                                                .data["company_name"],
                                            location: currSearchStuff[index]
                                                .data["location"],
                                          ),
                                        )
                                      : Container();
                                },
                                childCount: currSearchStuff.length ?? 0,
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
    );
  }
}
