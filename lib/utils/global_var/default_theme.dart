import 'package:flutter/material.dart';

import '../const/app_colors.dart';
import 'font_families.dart';

class DefaultTheme {
  static final _textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamilies.titilliumWeb,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamilies.titilliumWeb,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamilies.titilliumWeb,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontFamily: FontFamilies.titilliumWeb,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontFamilies.titilliumWeb,
      fontSize: 13,
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamilies.titilliumWeb,
      fontSize: 12,
    ),
  );

  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.greenNeonLight).copyWith(background: Colors.white),
    useMaterial3: true,
    textTheme: _textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.greenNeonLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    tooltipTheme: const TooltipThemeData(
      textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w100),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(0, 3),
            spreadRadius: 2.0,
          ),
        ],
      ),
    ),
  );
}
