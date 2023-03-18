import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Default [ThemeData] for Courtyard
class AppTheme {
  /// Default constructor for Courtyard [ThemeData]
  AppTheme(this._brightness);

  final Brightness _brightness;

  /// Exposes theme data to MaterialApp
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      brightness: _brightness,
      // fontFamily: 'Lexend',
      // textTheme: appTextTheme,
      // appBarTheme: appBarTheme,
      // scaffoldBackgroundColor: AppColors.brandWhite,
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(
          color: Colors.red.shade500,
        ),
      ),
    );
  }
}
