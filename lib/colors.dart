import 'package:flutter/material.dart';

/// Colors for the project
// Primary Colors
const Color _primaryColor     = Color(0x9d75cb);
const Color _onPrimaryColor   = Color(0xfdbd0d);

// Secondary Colors
const Color _secondaryColor   = Color(0x004a0d67);
const Color _onSecondaryColor = Color(0x004a0d67);

// Error Colors
const Color _errorColor       = Color(0x00df2935);
const Color _onErrorColor     = Color(0x0002182b);

// Background Colors
const Color _backgroundColor  = Color(0x004a0d67);
const Color _onBackgroundColor = Color(0x00fdbd0d);

// Surface Colors
const Color _surfaceColor      = Color(0x00000000);
const Color _onSurfaceColor    = Color(0x00000240);

/// Color Schemes for the project
const ColorScheme projectColorScheme = ColorScheme(
  primary: _primaryColor,
  onPrimary: _onPrimaryColor,

  secondary: _secondaryColor,
  onSecondary: _onSecondaryColor,

  error: _errorColor,
  onError: _onErrorColor,

  background: _backgroundColor,
  onBackground: _onBackgroundColor,

  surface: _surfaceColor,
  onSurface: _onSecondaryColor,

  brightness: Brightness.light,
);

