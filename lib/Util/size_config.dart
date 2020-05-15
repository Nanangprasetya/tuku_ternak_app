import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;

  static double screenWidth;
  static double screenHeight;
  static double heightMultiplier;
  static double widthMultiplier;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    widthMultiplier = (screenWidth - _safeAreaHorizontal) / 100;
    heightMultiplier = (screenHeight - _safeAreaVertical) / 100;

    // print(screenWidth);
    // print(screenHeight);

    // print("HeightMultiplier => $heightMultiplier");
    // print("WidthMultiplier => $widthMultiplier");
  }
}
