import 'package:flutter/material.dart';
import 'package:up_service/pages/layers/UI/pages/menu_dashboard_layout/dashboard.dart';
import 'package:up_service/pages/layers/UI/menu.dart';
import 'package:up_service/pages/layers/UI/pages/search.dart';

final Color backgroundColor = Color(0xFFFFD54F);

class MenuDashboardLayout extends StatefulWidget {
  const MenuDashboardLayout({Key key}) : super(key: key);

  @override
  _MenuDashboardLayoutState createState() => _MenuDashboardLayoutState();
}

class _MenuDashboardLayoutState extends State<MenuDashboardLayout>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  //below line scales the contents on the dashboard just incase the top measurements exceeds the screen scale
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuscaleAnimation;
  Animation<Offset> _slideAnimation;
  //animation for the menu contents above

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

  void onMenuTap() {
    setState(() {
      if (isCollapsed)
        _controller.forward();
      else
        _controller.reverse();
      isCollapsed = !isCollapsed;
    });
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
          Menu(
            slideAnimation: _slideAnimation,
            menuAnimation: _menuscaleAnimation,
          ),
          Dashboard(
            duration: duration,
            onMenuTap: onMenuTap,
            scaleAnimation: _scaleAnimation,
            isCollapsed: isCollapsed,
            screenWidth: screenWidth,
            child: SearchPage(
              onMenuTap: onMenuTap,
            ),
          ),
        ],
      ),
    );
  }
}
