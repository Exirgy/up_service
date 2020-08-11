import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// dark theme
// Colors
Color dBackGroundColor = Color.fromRGBO(59, 59, 73, 1);
Color dCardColor = Color.fromRGBO(69, 69, 82, 1);
Color dTitleTextColor = Colors.grey[100];
Color dSubTitleTextColor = Colors.grey[300];
Color dTextLightColor = Colors.grey[300];
Color dBodyTextColor = Colors.grey[200];
double deviceWidth; // This is assigned a value in the home.dart page.
// Text styles
TextStyle appBarTextStyle = GoogleFonts.workSans(
    textStyle: TextStyle(
  fontSize: (0.014 * deviceWidth) + 11.4,
  color: dTitleTextColor,
  fontWeight: FontWeight.w500,
));

TextStyle titleTextStyle = GoogleFonts.vesperLibre(
    textStyle: TextStyle(
  fontSize: (0.014 * deviceWidth) + 14.4,
  color: dTitleTextColor,
  fontWeight: FontWeight.bold,
));

TextStyle subTitleTextStyle = GoogleFonts.vesperLibre(
    textStyle: TextStyle(
  fontSize: (0.014 * deviceWidth) + 13.4,
  color: dSubTitleTextColor,
  fontWeight: FontWeight.w500,
));

TextStyle subSubTitleTextStyle = GoogleFonts.vesperLibre(
    textStyle: TextStyle(
  fontSize: (0.016 * deviceWidth) + 5.6,
  color: dSubTitleTextColor,
  fontWeight: FontWeight.w500,
));

TextStyle bodyTextStyle = GoogleFonts.quattrocentoSans(
    textStyle: TextStyle(
  fontSize: (0.018 * deviceWidth) + 7.8,
  color: dBodyTextColor,
));

TextStyle subBodyTextStyle = GoogleFonts.quattrocentoSans(
    textStyle: TextStyle(
  fontSize: (0.016 * deviceWidth) + 7.6,
  color: dTextLightColor,
  fontWeight: FontWeight.normal,
));

TextStyle subSubBodyTextStyle = GoogleFonts.quattrocentoSans(
    textStyle: TextStyle(
  fontSize: (0.012 * deviceWidth) + 6.2,
  color: dTextLightColor,
  fontWeight: FontWeight.normal,
));

TextStyle questionTextStyle = GoogleFonts.eczar(
  textStyle: TextStyle(
    fontSize: (0.028 * deviceWidth) + 4.8,
    color: Color(0xFFFFFFFF),
    fontWeight: FontWeight.normal,
    height: 1.5,
  ),
);

TextStyle choiceTextStyle = GoogleFonts.quattrocentoSans(
  textStyle: TextStyle(
    fontSize: (0.024 * deviceWidth) + 10.4,
    color: dBodyTextColor,
    fontWeight: FontWeight.normal,
  ),
);
