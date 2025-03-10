import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.green;
  static final ThemeData ligtTheme = ThemeData.light().copyWith(
      //Color Primario
      primaryColor: primary,
      //appBarTheme
      appBarTheme: const AppBarTheme(
        color: primary,
        centerTitle: true,
      ),
      //CardTheme
      cardTheme: CardTheme(
        elevation: 20,
        shadowColor: AppTheme.primary.withOpacity(0.5),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      //TextButton theme
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
      //floatingbutton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 20
          //shadowColor: primary.withOpacity(0.5),
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppTheme.primary,
          shape: const StadiumBorder(),
          shadowColor: primary,
          elevation: 20,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primary),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
      ));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      //Color Primario
      primaryColor: primary,
      //appBarTheme
      appBarTheme: const AppBarTheme(
        color: primary,
        centerTitle: true,
      ));
}
