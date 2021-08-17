// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class ThemeProvider with ChangeNotifier {
  bool isLightTheme;

  ThemeProvider({required this.isLightTheme});

  // the code below is to manage the status bar color when the theme changes
  getCurrentStatusNavigationBarColor() {
    if (isLightTheme) {
      // ignore: prefer_const_constructors
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: const Color(0xFFFFFFFF),
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    } else {
      // ignore: prefer_const_constructors
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: const Color(0xFF26242e),
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    }
  }

  // use to toggle the theme
  toggleThemeData() async {
    final settings = await Hive.openBox('settings');
    settings.put('isLightTheme', !isLightTheme);
    isLightTheme = !isLightTheme;
    getCurrentStatusNavigationBarColor();
    notifyListeners();
  }

  // Global theme data we are always check if the light theme is enabled #isLightTheme
  ThemeData themeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: isLightTheme ? Colors.grey : Colors.grey,
      primaryColor: isLightTheme ? Colors.white : Color(0xFF1E1F28),
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      backgroundColor: isLightTheme ? const Color(0xFF26242e) : const Color(0xFFFFFFFF),
      scaffoldBackgroundColor:
          isLightTheme ? const Color(0xFFFFFFFF) : Color(0xFF26242e),
    );
  }

  // Theme mode to display unique properties not cover in theme data
  ThemeColor themeMode() {
    return ThemeColor(
      gradient: [
        if (isLightTheme) ...[const Color(0xDDFF0080), const Color(0xDDFF8C00)],
        if (!isLightTheme) ...[const Color(0xFF8983F7), const Color(0xFFA3DAFB)]
      ],
      textColor: isLightTheme ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
      toggleButtonColor: isLightTheme ? const Color(0xFf34323d) : const Color(0xFFFFFFFF),
      toggleBackgroundColor:
          isLightTheme ? const Color(0xFF222029) : const Color(0xFFe7e7e8),
      shadow: [
        if (isLightTheme)
          const BoxShadow(
              color: Color(0x66000000),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5)),
        if (!isLightTheme)
          const BoxShadow(
              color: Color(0xFFd8d7da),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5))
      ], backgroundColor: Colors.white,
    );
  }
}

// A class to manage specify colors and styles in the app not supported by theme data
class ThemeColor {
  List<Color> gradient;
  Color backgroundColor;
  Color toggleButtonColor;
  Color toggleBackgroundColor;
  Color textColor;
  List<BoxShadow> shadow;

  ThemeColor({
    required this.gradient,
    required this.backgroundColor,
    required this.toggleBackgroundColor,
    required this.toggleButtonColor,
    required this.textColor,
    required this.shadow,
  });
}
