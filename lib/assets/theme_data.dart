import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
  primaryColor: const Color(0xffffc107),
  primaryColorLight: const Color(0xffffecb3),
  primaryColorDark: const Color(0xffffa000),
  appBarTheme: const AppBarTheme(
    color: Color(0xffffc107),
    elevation: 4,
    shadowColor: Color(0x1f000000),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    toolbarTextStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    iconTheme: IconThemeData(
      color: Color(0xdd000000),
      opacity: 1,
      size: 24,
    ),
  ),
  canvasColor: const Color(0xfffafafa),
  scaffoldBackgroundColor: const Color(0xfffafafa),
  bottomAppBarColor: const Color(0xffffffff),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0x1f000000),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  selectedRowColor: const Color(0xfff5f5f5),
  unselectedWidgetColor: const Color(0x8a000000),
  disabledColor: const Color(0x61000000),
  secondaryHeaderColor: const Color(0xfffff8e1),
  backgroundColor: const Color(0xffffe082),
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: const Color(0xffffc107),
  hintColor: const Color(0x8a000000),
  errorColor: const Color(0xffd32f2f),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.amber,
    accentColor: const Color(0xffffc107),
    cardColor: const Color(0xffffffff),
    backgroundColor: const Color(0xffffe082),
    errorColor: const Color(0xffd32f2f),
    brightness: Brightness.light,
  ).copyWith(
    secondary: const Color(0xffffc107),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.black, // Text color
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xffffc107), // Background color
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: const Color(0xffffc107), // Border color
    ),
  ),
);
