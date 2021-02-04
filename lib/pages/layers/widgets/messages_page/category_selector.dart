import 'package:flutter/material.dart';
import 'package:up_service/pages/layers/widgets/messages_page/groups.dart';
import 'package:up_service/pages/layers/widgets/messages_page/online.dart';
import 'package:up_service/pages/layers/widgets/messages_page/message_search.dart';
import 'package:up_service/pages/layers/widgets/messages_page/recent_chats.dart';
import 'package:up_service/pages/layers/widgets/messages_page/requests.dart';

class CategorySelector extends StatefulWidget {
  CategorySelector({Key key}) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int _selectedPage = 1;
  final List<Widget> _pageOptions = [
    GroupScreen(),
    OnlineScreen(),
    MessagesSearch(),
    RequestScreen(),
    RecentChats(),
  ];
  void onTapped(int pageTapped) {
    setState(() {
      //print(pageTapped);
      _selectedPage = pageTapped;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => _pageOptions[pageTapped]));
      //print(_selectedPage);
    });
  }

  final List<String> categories = [
    'Messages',
    'Search',
    'Online',
    'Groups',
    'Requests'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPage = index;
                });
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 30.0),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: index == _selectedPage
                          ? Colors.black
                          : Colors.white60,
                      fontSize: 18.0,
                    ),
                  )),
            );
          }),
    );
  }
}
