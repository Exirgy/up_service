import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:up_service/pages/layers/views/pages/Reviews.dart';
import 'package:up_service/pages/layers/views/pages/categories.dart';
import 'package:up_service/pages/layers/views/pages/favorites.dart';
import 'package:up_service/pages/layers/views/pages/menu_dashboard_layout/dashboard.dart';
import 'package:up_service/pages/layers/views/pages/messages.dart';
import 'package:up_service/pages/layers/views/pages/search.dart';
import 'package:up_service/pages/layers/views/pages/settings.dart';

import 'package:up_service/state/navigation.state.dart';

import 'menu.dart';

final Color backgroundColor = Color(0xFFFEF9EB);

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
  NavigationState navigationState;
  ReactionDisposer disposeAutorun;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuscaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    Future.delayed(Duration.zero, () async {
      log('menu_dashboard_layout has been initiated');
      disposeAutorun =
          reaction((_) => navigationState.showMenu, (bool menuState) {
        log('current menu state is $menuState');
        if (menuState) {
          setState(() {
            isCollapsed = false;
          });
          onMenuTap();
        } else {
          setState(() {
            isCollapsed = true;
          });
          onMenuTap();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    disposeAutorun();
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

  Widget currentPage() {
    switch (navigationState.currentPage) {
      case NavigationScreen.Search:
        return SearchPage();
        break;
      case NavigationScreen.Categories:
        return CategoriesPage();
        break;
      case NavigationScreen.Messages:
        return MessagesPage();
        break;
      case NavigationScreen.Reviews:
        return ReviewsPage();
        break;
      case NavigationScreen.Favorites:
        return FavoritesPage();
        break;
      case NavigationScreen.Settings:
        return SettingsTab();
        break;
      default:
        return CategoriesPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    navigationState = Provider.of<NavigationState>(context);
    return Observer(builder: (_) {
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
              scaleAnimation: _scaleAnimation,
              isCollapsed: isCollapsed,
              screenWidth: screenWidth,
              child: Observer(builder: (_) {
                return currentPage();
              }),
            ),
          ],
        ),
      );
    });
  }
}
