import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({required this.borderColor, required this.subTextColor});

  final Color borderColor;
  final Color subTextColor;

  @override
  MyColors copyWith({Color? borderColor, Color? subTextColor}) {
    return MyColors(
      borderColor: borderColor ?? this.borderColor,
      subTextColor: subTextColor ?? this.subTextColor,

    );
  }

  @override
  MyColors lerp(MyColors? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      borderColor:
          Color.lerp(borderColor, other.borderColor, t) ?? Colors.transparent,
      subTextColor:
          Color.lerp(subTextColor, other.subTextColor, t) ?? Colors.transparent,
    );
  }
}
