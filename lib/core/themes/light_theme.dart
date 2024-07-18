import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: false,
        primaryColor: const Color(0xff2188FF),
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xff2188FF),
            onPrimary: Color(0xffFFFFFF),
            secondary: Color(0xff17192D),
            onSecondary: Color(0xffFFFFFF),
            error: Color(0xffED3833),
            onError: Color(0xffFFFFFF),
            surface: Color(0xffFFFFFF),
            onSurface: Color(0xff17192D),
            surfaceContainer: Color(0xffEAEFF3),
            outline: Color(0xff77818C),
            tertiary: Color(0xff52C41A)),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            height: 1.29,
          ),
          bodyLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            height: 1.50,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.15,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.15,
          ),
        ).apply(
          bodyColor: const Color(0xff17192D),
          displayColor: const Color(0xff17192D),
        ),
      );
}
