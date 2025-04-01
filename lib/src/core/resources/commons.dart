import 'package:flutter/material.dart';

class Commons {
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 600;
  }
}
