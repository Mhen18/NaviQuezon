import 'package:flutter/material.dart';

import 'package:naviquezon/src/core/themes/styles/color_style.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';

class AppTheme {
  /// Global theme for App Bar
  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: textStyle16w600,
      surfaceTintColor: Colors.transparent,
      elevation: 0.5,
      iconTheme: const IconThemeData(
        color: Colors.black87,
      ),
    );
  }

  /// Global theme for Progress Indicator
  static ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: color1363DF,
    );
  }

  /// Global theme for Elevated Button
  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: color1363DF,
        shadowColor: color1363DF,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: color1363DF,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: textStyle14w700.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  /// Theme data for app in default theme mode
  static final themeData = ThemeData(
    useMaterial3: true,
    primaryColor: color1363DF,
    appBarTheme: _appBarTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
  );
}
