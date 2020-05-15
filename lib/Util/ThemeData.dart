import 'package:flutter/material.dart';

final ThemeData kLightTheme = _lightTheme();

ThemeData _lightTheme() {
  final data = ThemeData.light();
  return data.copyWith(
      //TODO: Theme custom here
      );
}

final ThemeData kDarkTheme = _darkTheme();

ThemeData _darkTheme() {
  final data = ThemeData.dark();
  return data.copyWith(
      //TODO: Theme custom here
      );
}
