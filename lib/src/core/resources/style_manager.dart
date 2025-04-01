import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/src/core/resources/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color? color,
  double? height,
) {
  return TextStyle(
    fontSize: fontSize.spMin,
    fontFamily: FontConstants.defaultFontFamily,
    color: color,
    fontWeight: fontWeight,
    height: height,
  );
}

// regular style

TextStyle getRegularStyle({
  double? fontSize,
  Color? color,
  double? height,
  TextDecoration? decoration,
}) {
  return _getTextStyle(
    fontSize ?? 14,
    FontWeightManager.regular,
    color,
    height,
  );
}

// medium style

TextStyle getMediumStyle({double? fontSize, Color? color, double? height}) {
  return _getTextStyle(fontSize ?? 14, FontWeightManager.medium, color, height);
}

// light style

TextStyle getLightStyle({double? fontSize, Color? color, double? height}) {
  return _getTextStyle(fontSize ?? 14, FontWeightManager.light, color, height);
}

// bold style

TextStyle getBoldStyle({double? fontSize, Color? color, double? height}) {
  return _getTextStyle(fontSize ?? 14, FontWeightManager.bold, color, height);
}

// semibold style

TextStyle getSemiBoldStyle({double? fontSize, Color? color, double? height}) {
  return _getTextStyle(
    fontSize ?? 14,
    FontWeightManager.semiBold,
    color,
    height,
  );
}
