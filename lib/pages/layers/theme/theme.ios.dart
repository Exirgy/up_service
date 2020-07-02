import 'package:flutter/cupertino.dart';

CupertinoTextThemeData _textTheme = CupertinoTextThemeData(
  navLargeTitleTextStyle: TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 42.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 7.0,
    color: Color(0xFFFFFFFF),
    // backgroundColor: Colors.black12,
    shadows: [
      Shadow(
        color: CupertinoColors.black,
        blurRadius: 5.0,
        offset: Offset(5.0, 5.0),
      ),
    ],
  ),
  navTitleTextStyle: TextStyle(
    fontFamily: 'Aileron',
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Color(0xFFFFFFFF),
    fontSize: 19,
  ),
  tabLabelTextStyle: TextStyle(
    fontFamily: 'Aileron',
    fontWeight: FontWeight.w600,
    // letterSpacing: 1,
    color: Color(0xFFEEEEEE),
    fontSize: 16,
  ),
);

// We want to override a default light blue theme.
final CupertinoThemeData cupertinoTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  textTheme: _textTheme,
  primaryColor: const Color(0xFFFFFFFF),
  barBackgroundColor: Color.fromRGBO(38, 38, 47, 1),
  // primaryContrastingColor: Color(0xFFFFFFFF),
  scaffoldBackgroundColor: Color.fromRGBO(59, 59, 73, 1),
  // primaryContrastingColor: Color(0xFF212121),
);
