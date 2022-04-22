import 'package:flutter/material.dart';
import 'colors.dart' as colors;

/// Holds the Themes for the project

final ThemeData projectTheme = _buildProjectTheme();

/// Handles the Project Theme
ThemeData _buildProjectTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,
    ).copyWith(
      secondary: const Color(0x00fdbd0d),
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Color(0x00fdbd0d),))
  );
  /*return ThemeData.from(
      colorScheme: colors.projectColorScheme,
      textTheme: null,
  );*/
}

