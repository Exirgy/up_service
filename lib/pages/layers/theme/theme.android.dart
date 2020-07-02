import 'package:flutter/material.dart';

TextTheme _textTheme = TextTheme(
  headline5: TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 49.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 7.0,
    color: Colors.white,
  ),
  headline6: TextStyle(
    fontFamily: 'Aileron',
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    color: Color(0xFFFFFFFF),
    fontSize: 14,
  ),
  subtitle2: TextStyle(
    fontFamily: 'Aileron',
    fontWeight: FontWeight.w600,
    // letterSpacing: 1,
    color: Color(0xFFEEEEEE),
    fontSize: 12,
  ),
  caption: TextStyle(
    fontFamily: 'Aileron',
    fontSize: 14.0,
    // color: Color.fromRGBO(0, 0, 0, .63),
    fontWeight: FontWeight.normal,
  ),
);

final ThemeData themeData = ThemeData(
  brightness: Brightness.dark,
  textTheme: _textTheme,
  primaryColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: Color.fromRGBO(59, 59, 73, 1),
  accentColor: const Color(0xFFFFFFFF),
  iconTheme: IconThemeData(
    color: const Color(0xFF800020),
    size: 20.0,
  ),
  canvasColor: Color.fromRGBO(38, 38, 47, 1),
  buttonTheme: ButtonThemeData(
      buttonColor: Colors.white, textTheme: ButtonTextTheme.primary),
  appBarTheme: AppBarTheme(
    color: Color.fromRGBO(38, 38, 47, 1),
    elevation: 5,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white, size: 16),
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.white, fontSize: 16),
    ),
  ),
  // buttonColor: Colors.white,
  // primaryColorDark: Color(0xFF212121),
);
