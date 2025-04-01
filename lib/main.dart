import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/src/app/app.dart';
import 'package:todo/src/core/resources/injection.dart';
import 'package:todo/src/core/resources/notification_helper.dart';

import 'firebase_options.dart';
import 'src/core/resources/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// disable app rotation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint('Flutter Error: ${details.exceptionAsString()}');
  };

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    /// check if the app is android or ios
    if (Platform.isAndroid) {
      showFlutterNotification(message);
    }
  }, onError: (error) {});

  initGetIt();

  runApp(MyApp());
}
