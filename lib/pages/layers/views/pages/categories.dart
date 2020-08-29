import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:up_service/state/navigation.state.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  NavigationState navigationState;
  @override
  Widget build(BuildContext context) {
    navigationState = Provider.of<NavigationState>(context);

    return Scaffold(
        //drawer: Drawer(),
        body: Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            //custom scroll behaviour for appbar
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: InkWell(
                onTap: () {
                  navigationState.showMenu = !navigationState.showMenu;
                  log(navigationState.showMenu.toString());
                },
                child: Icon(Icons.menu, color: Colors.black),
              ),
              iconTheme: new IconThemeData(color: Colors.blue),
              floating: true,
              snap: true,
              //seethrough
              backgroundColor: Colors.transparent,

              //shadow
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
                future: Firestore.instance
                    .collection("service_type")
                    .orderBy("pos")
                    .getDocuments(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return SliverToBoxAdapter(
                      child: Container(
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  else {
                    return SliverStaggeredGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      staggeredTiles: snapshot.data.documents.map((doc) {
                        return StaggeredTile.count(
                            doc.data["x"], doc.data["y"]);
                      }).toList(),
                      children: snapshot.data.documents.map((doc) {
                        return Container(
                          height: 200.0,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            child: Card(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                    side: BorderSide(
                                        color: Colors.grey, width: 1.0)),
                                clipBehavior: Clip.antiAlias,
                                elevation: 5.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () {},
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 0.0,
                                            left: 0.0,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 6, top: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  //The title
                                                  Text(
                                                    doc.data["title"],
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            67, 73, 80, 1),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
//                Text(
//                  "quantity"
////                  doc.data["quantity"],
//                  ,style: TextStyle(
//                      color: Colors
//                          .grey[500],
//                      fontSize: 12.0,
//                      fontWeight:
//                          FontWeight
//                              .bold),
//                )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8, right: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    FadeInImage.memoryNetwork(
                                                      height: 70.0,
                                                      width: 70.0,
                                                      placeholder:
                                                          kTransparentImage,
                                                      alignment:
                                                          FractionalOffset
                                                              .bottomRight,
                                                      image:
                                                          doc.data["imgLink"],
                                                      fit: BoxFit.fill,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                )),
                          ),
                        );
                      }).toList(),
                    );
                  }
                })
          ],
        ),
      ],
    ));
  }
}
