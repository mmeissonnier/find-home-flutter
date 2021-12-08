import 'package:flutter/material.dart';

const String apiBasePath = 'find-home-api.herokuapp.com';

const colorScheme = ColorScheme(
    primary: Color(0xFF143656),
    primaryVariant: Color(0xFF13497B),
    secondary: Color(0xFF46D0D9),
    secondaryVariant: Color(0xFF497FAF),
    surface: Color(0xFFF8FBFF),
    background: Color(0xFFFFFFFF),
    error: Color(0xFFFF0000),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF143656),
    onBackground: Color(0xFF143656),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light);

const textTheme = TextTheme(
    caption: TextStyle(
        color: Colors.black26,
        fontFamily: 'RubikLight',
        fontWeight: FontWeight.normal,
        fontSize: 11),
    overline: TextStyle(
        color: Color(0xFF13497B),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.normal,
        fontSize: 14),
    bodyText1: TextStyle(
        color: Color(0xFF13497B),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.normal,
        fontSize: 14),
    bodyText2: TextStyle(
        color: Color(0xFF143656),
        fontFamily: 'RubikLight',
        fontWeight: FontWeight.normal,
        fontSize: 14),
    headline1: TextStyle(
        color: Color(0xFF143656),
        fontFamily: 'RubikMedium',
        fontWeight: FontWeight.normal,
        fontSize: 40),
    headline2: TextStyle(
        color: Color(0xFF143656),
        fontFamily: 'RubikMedium',
        fontWeight: FontWeight.normal,
        fontSize: 20),
    headline3: TextStyle(
        color: Color(0xFF143656),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.normal,
        fontSize: 20),
    headline4: TextStyle(
        color: Color(0xFF143656),
        fontFamily: 'Rubik',
        fontWeight: FontWeight.normal,
        fontSize: 26),
    subtitle1: TextStyle(
        color: Colors.black38,
        fontFamily: 'RubikLight',
        fontWeight: FontWeight.normal,
        fontSize: 20),
    button: TextStyle(
        color: Color(0xFFFFFFFF),
        fontFamily: 'RubikMedium',
        fontWeight: FontWeight.normal,
        fontSize: 14));

final themeData = ThemeData(
  // This is the theme of your application.
  colorScheme: colorScheme,
  textTheme: textTheme,
  fontFamily: 'Rubik',
);
