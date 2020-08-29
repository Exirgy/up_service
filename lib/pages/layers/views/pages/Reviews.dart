import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:up_service/pages/layers/widgets/rating_bar.dart';
import 'package:up_service/state/navigation.state.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key key}) : super(key: key);

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  NavigationState navigationState;
  @override
  Widget build(BuildContext context) {
    navigationState = Provider.of<NavigationState>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                navigationState.showMenu = !navigationState.showMenu;
                log(navigationState.showMenu.toString());
              },
              child: Icon(Icons.menu, color: Colors.black),
            ),
            title: Text(
              'Reviews',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () {})
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.rate_review),
                  text: "Reviews",
                ),
                Tab(icon: Icon(Icons.design_services), text: "Services"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: RatingBar(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Center(
                      child: Column(
                    children: [
                      Text(
                        'Qualified Coffee Maker',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          'I used to work for Jps Coffee House in Holland,and i have done some side coffee consulting and training through what was the Midwest Barista School I have also pcompeted in latte art championships and helped Java Cofee house Kenya to take part in 3rd America best coffee house 2018',
                          style: TextStyle(
                              //fontSize: 30.0,

                              ),
                        ),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: 100.0,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: const Text('Leave a Review!',
                          style: TextStyle(fontSize: 20)),
                      color: Color(0xFFFF9100),
                      textColor: Colors.white,
                      elevation: 5,
                    ),
                  )
                ],
              )),
              Container(
                child: RatingBar(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              )
            ],
          )),
    );
  }
}
