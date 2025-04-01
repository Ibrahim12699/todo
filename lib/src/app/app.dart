import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/core/resources/app_constants.dart';
import 'package:todo/src/core/resources/route_manager.dart';

import '../core/resources/theme/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal(); // single instance

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RouteGenerator routeGenerator = RouteGenerator();
  final Locale _locale = const Locale('en');
  final ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp();
  }


  Widget _buildMaterialApp() {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: RouteGenerator.router,
          title: AppConstants.appName,
          locale: _locale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          themeMode: _themeMode,
          themeAnimationCurve: Curves.linear,
          theme: lightTheme,
          // darkTheme: kDarkTheme,
          themeAnimationDuration: const Duration(milliseconds: 300),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1)),
              child: child ?? SizedBox(),
            );
          },
        );
      },
    );
  }
}
