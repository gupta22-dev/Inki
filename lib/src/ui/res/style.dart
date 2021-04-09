import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inki/src/ui/res/colors.dart';

TextTheme darkTextTheme = TextTheme(
  headline1: TextStyle(
// top most head title
    fontFamily: 'Montserrat',
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  ),
  headline2: TextStyle(
// top most head title
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  headline3: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  subtitle1: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  subtitle2: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  headline4: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  headline5: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 13.0,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  ),
  headline6: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  bodyText1: TextStyle(
    fontFamily: 'Montserrat',
// cardtext line one
    fontSize: 15.0,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  ),
  bodyText2: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15.0,
    fontStyle: FontStyle.normal,
    color: Colors.grey,
  ),
);

TextTheme lightTextTheme = TextTheme(
//body1: TextStyle(color: LightColor.titleTextColor),
  headline1: TextStyle(
// top most head title
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: lightBlack,
  ),
  headline2: TextStyle(
// top most head title

    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    color: lightBlack,
  ),
  headline3: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: lightBlack,
      letterSpacing: 1),
  subtitle1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: lightBlack,
      letterSpacing: 1),
  subtitle2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: lightBlack,
      letterSpacing: 1),
  headline4: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: lightBlack,
      letterSpacing: 1),
  headline5: TextStyle(
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
      color: lightBlack,
      letterSpacing: 1),
  headline6: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w200,
      color: lightBlack,
      letterSpacing: 1),
  bodyText1: TextStyle(
// cardtext line one
      fontSize: 14.0,
      fontStyle: FontStyle.normal,
      color: lightBlack,
      letterSpacing: 1),
  bodyText2: TextStyle(
      fontSize: 15.0,
      fontStyle: FontStyle.normal,
      color: Colors.grey,
      letterSpacing: 1),
);

class ThemeChanger {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Color(0xff9DC40D),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: GoogleFonts.robotoTextTheme(lightTextTheme),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    accentColor: Color(0xff9DC40D),
    appBarTheme: AppBarTheme(
      color: Colors.black38,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: GoogleFonts.latoTextTheme(darkTextTheme),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
// scaffoldBackgroundColor: Colors.white,
  );
}
