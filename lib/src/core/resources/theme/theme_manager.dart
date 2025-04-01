import 'package:flutter/material.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/theme/my_colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: ColorManager.primaryColor,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: ColorManager.primaryColor,
    onPrimary: ColorManager.white,
    secondary: ColorManager.primaryColor,
    onSecondary: ColorManager.white,
    error: ColorManager.errorColor,
    onError: ColorManager.white,
    surface: ColorManager.white,
    onSurface: ColorManager.black,
  ),
  datePickerTheme: DatePickerThemeData(
    dayOverlayColor: WidgetStateProperty.all(ColorManager.primaryColor),
    todayBorder: BorderSide(),
    confirmButtonStyle: _confirmButtonStyle,
    cancelButtonStyle: _cancelButtonStyle,
  ),
  timePickerTheme: TimePickerThemeData(
    confirmButtonStyle: _confirmButtonStyle,
    cancelButtonStyle: _cancelButtonStyle,
  ),

  extensions: <ThemeExtension<dynamic>>[
    MyColors(borderColor: Color(0xFFE5E7EB), subTextColor: Color(0xFF727374)),
  ],
);
ButtonStyle _confirmButtonStyle = ButtonStyle(
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  foregroundColor: WidgetStateProperty.all(ColorManager.white),
  textStyle: WidgetStateProperty.all(TextStyle(color: ColorManager.white)),
  backgroundColor: WidgetStateProperty.all(ColorManager.primaryColor),
);

ButtonStyle _cancelButtonStyle = ButtonStyle(
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),

  side: WidgetStateProperty.all(
    BorderSide(color: ColorManager.borderColor, width: 2),
  ),
  foregroundColor: WidgetStateProperty.all(ColorManager.black),
  textStyle: WidgetStateProperty.all(TextStyle(color: ColorManager.black)),
  backgroundColor: WidgetStateProperty.all(ColorManager.white),
);
