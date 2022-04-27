import 'package:flutter/material.dart';
import 'colors.dart' as colors;

/// Dungeon's Oracle Theme
class DungeonsOracleTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      /// Brightness
      brightness: Brightness.light,

      /// Colors
      primaryColor: colors.primaryColor,

      /// Appbar
      appBarTheme: AppBarTheme(
        color: colors.backgroundColor,
        foregroundColor: colors.accentColor,
        iconTheme: IconThemeData(
          color: colors.accentColor,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),

      /// Text
      fontFamily: 'Montserrat',
      textTheme: ThemeData.light().textTheme.copyWith(

              /// Title
              headline6: TextStyle(
            color: colors.accentColor,
          )),

      /// Background
      scaffoldBackgroundColor: colors.backgroundColor,

      /// Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: colors.primaryColor,
        onPrimary: colors.accentColor,
        fixedSize: const Size(200, 50),
        padding: const EdgeInsets.all(4.0),
      )),
      // More Info: https://www.kindacode.com/article/working-with-elevatedbutton-in-flutter/#Style_Color_Border_Elevation…
    );
  }

  static TextStyle get titleTheme {
    return TextStyle(
      fontSize: 36,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.solid,
      decorationColor: colors.accentColor,
      decorationThickness: 2,
      color: colors.accentColor,
    );
  }
}
