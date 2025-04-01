import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/src/core/resources/app_constants.dart';
import 'package:todo/src/core/resources/assets_manager.dart';
import 'package:todo/src/core/resources/cache_helper.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    requestPermission();
    _loadData();
    _timer = Timer(const Duration(seconds: 2), _goNext);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: SvgPicture.asset(AssetsManager.logo, height: 150.r, width: 150.r),
    );
  }

  Future<void> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
  }

  void _loadData() {
    CacheHelper.getData(key: AppConstants.uidKey).then((value) {
      AppConstants.uid = value;
    });
  }

  void _goNext() {
    if (AppConstants.uid == null) {
      context.go(Routes.authRoute);
    } else {
      context.go(Routes.tasksRoute);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
