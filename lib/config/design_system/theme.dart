import 'package:flutter/material.dart';
import 'package:sermanos/config/design_system/tab_bar_theme.dart';
import 'package:sermanos/config/design_system/text_theme.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_colors.dart';

import 'appbar_theme.dart';

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
      fontFamily: 'Roboto',
      textTheme: appTextTheme,
      appBarTheme: appBarTheme,
      scaffoldBackgroundColor: SermanosColors.neutral0,
      tabBarTheme: appTabBarTheme,
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(
          color: Colors.red.shade500,
        ),
      ),
    );
  }
}
