import 'package:flutter/material.dart';
import 'package:provider_http_req/Util/Colors.dart';

//bold = w700
//medium = w500
//medium = w400

class AppStyles {
  AppStyles._();

  ///28 //bold
  static TextStyle headline1(BuildContext context) {
    return TextStyle(
        fontFamily: "Roboto",
        fontSize: AppFontSizes.largest,
        fontWeight: FontWeight.w700,
        color: DataColors.one);
  }

  ///24 //Medium
  static TextStyle headline2(BuildContext context) {
    return TextStyle(
        fontFamily: "Roboto",
        fontSize: AppFontSizes.larger,
        fontWeight: FontWeight.w500,
        color: DataColors.one);
  }

  ///18 //Medium
  static TextStyle headline3(BuildContext context) {
    return TextStyle(
        fontFamily: "Roboto",
        fontSize: AppFontSizes.large,
        fontWeight: FontWeight.w500,
        color: DataColors.two);
  }
///18 //Regular
  static TextStyle headline4(BuildContext context) {
    return TextStyle(
        fontFamily: "Roboto",
        fontSize: AppFontSizes.large,
        fontWeight: FontWeight.w400,
        color: DataColors.one);
  }

///16 //Medium
  static TextStyle subhead(BuildContext context) {
    return TextStyle(
        fontFamily: "Roboto",
        fontSize: AppFontSizes.medium,
        fontWeight: FontWeight.w500,
        color: DataColors.two);
  }
///14 //Medium
  static TextStyle discriptionItem(BuildContext context) {
    return TextStyle(
        fontFamily: "Roboto",
        fontSize: AppFontSizes.small,
        fontWeight: FontWeight.w500,
        color: DataColors.tri);
  }

///14 //Regular
  static TextStyle discriptionText(BuildContext context) {
    return TextStyle(
        fontFamily: "Roboto",
        fontSize: AppFontSizes.small,
        fontWeight: FontWeight.w400,
        color: DataColors.two);
  }
///12 //Medium
  static TextStyle titleHelper(BuildContext context) {
    return TextStyle(
        fontFamily: "Roboto",
        fontSize: AppFontSizes.smallest,
        fontWeight: FontWeight.w500,
        color: DataColors.two);
  }
///12 //Regular
  static TextStyle textHelper(BuildContext context) {
    return TextStyle(
        fontFamily: "Roboto",
        fontSize: AppFontSizes.smallest,
        fontWeight: FontWeight.w400,
        color: DataColors.four);
  }

///16 //Medium
  static TextStyle search(BuildContext context) {
    return TextStyle(
        fontFamily: "Roboto",
        fontSize: AppFontSizes.medium,
        fontWeight: FontWeight.w500,
        color: DataColors.five);
  }
}

class AppFontSizes {
  static const smallest = 12.0;
  static const small = 14.0;
  static const medium = 16.0;
  static const large = 18.0;
  static const larger = 24.0;
  static const largest = 28.0;
}
