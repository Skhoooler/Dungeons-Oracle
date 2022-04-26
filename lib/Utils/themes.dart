import 'package:flutter/material.dart';
import 'colors.dart' as colors;

/// Dungeon's Oracle Theme
class DungeonsOracleTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: colors.primaryColor,
      scaffoldBackgroundColor: colors.backgroundColor,
      fontFamily: 'Montserrat',
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        buttonColor: colors.secondaryColor,
      )
    );
  }
}/*ThemeData _buildProjectTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,
    ).copyWith(
      secondary: const Color(0x00fdbd0d),
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Color(0x00fdbd0d),))
  );
  return ThemeData.from(
      colorScheme: colors.projectColorScheme,
      textTheme: null,
  );
}*/


