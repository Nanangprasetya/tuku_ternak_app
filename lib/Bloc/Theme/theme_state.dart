import 'package:flutter/material.dart';
import 'package:provider_http_req/Util/ThemeData.dart';

class ThemeState {
  final ThemeData themeData;
  final bool valueData;

  ThemeState(this.themeData, this.valueData);

  factory ThemeState.light() {
    return ThemeState(kLightTheme, false);
  }

  factory ThemeState.dark() {
    return ThemeState(kDarkTheme, true);
  }


}
