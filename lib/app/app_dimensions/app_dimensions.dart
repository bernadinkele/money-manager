import 'package:flutter/material.dart'
    show GlobalKey, NavigatorState, MediaQuery;

class AppDimensions {
  static late GlobalKey<NavigatorState> navigatorKey;

  static void init(GlobalKey<NavigatorState> key) {
    navigatorKey = key;
  }

  static double get height =>
      MediaQuery.of(navigatorKey.currentContext!).size.height;

  static double get width =>
      MediaQuery.of(navigatorKey.currentContext!).size.width;
}

double getHeight(double inputHeight) {
  //double screenHeight = AppDimensions.height;
  return inputHeight;
}

double getWidth(double inputWidth) {
  double screenWidth = AppDimensions.width;
  return inputWidth;
}

double getFontSize(double px) {
  var height = getHeight(px);
  var width = getWidth(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}