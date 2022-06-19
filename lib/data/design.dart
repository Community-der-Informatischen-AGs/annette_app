import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO: implement textThemes

class Design {
  static Color annetteColor = Color.fromRGBO(111, 162, 171, 1);
  static Color annetteColorLight = Color.fromRGBO(0, 156, 170, 1);
  static double standardPagePadding = 15.0;
  static LinearGradient lightGradient =
      LinearGradient(colors: [Colors.white, Colors.white]);
  static LinearGradient darkGradient =
      LinearGradient(colors: [Colors.black, Colors.black]);

  static ThemeData darkTheme = ThemeData(
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith(
            (states) => annetteColorLight.withOpacity(0.1)),
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
        textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(
              fontSize: 17,
            )),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => annetteColor,
        ),
        foregroundColor:
            MaterialStateColor.resolveWith((states) => Colors.black),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith(
                (states) => annetteColorLight.withOpacity(0.1)),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white))),
    brightness: Brightness.dark,
    cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: TextStyle(color: Colors.white),
      ),
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(foregroundColor: Colors.black),
    //buttonTheme: ButtonThemeData(buttonColor: Colors.tealAccent),
    buttonTheme: ButtonThemeData(
      buttonColor: annetteColor,
    ),
    accentColor: annetteColor,
    snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(
      color: Colors.white,
    )),
  );

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: annetteColor,
        fontWeight: FontWeight.w800,
        fontSize: 20
      ),
      iconTheme: IconThemeData(
        color: annetteColor
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: annetteColor,
    ),
    snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(
      color: Colors.white,
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith(
            (states) => annetteColorLight.withOpacity(0.1)),
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.black87),
        textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(
              fontSize: 17,
            )),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => annetteColor,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith(
                (states) => annetteColorLight.withOpacity(0.1)),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.black))),
    brightness: Brightness.light,
    accentColor: Colors.black54,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: annetteColor, foregroundColor: Colors.white),
  );
}
