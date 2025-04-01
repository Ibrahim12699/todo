import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo/src/core/resources/app_constants.dart';

class CacheHelper {
  static late FlutterSecureStorage storage;

  static Future init() async {
    storage = const FlutterSecureStorage();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    bool isSaved = false;
    try {
      await storage.write(key: key, value: value);
      isSaved = true;
    } catch (e, s) {
      debugger(
        when: AppConstants.openDebug,
        message: "$e , $s",
      );
      return isSaved;
    }
    return isSaved;
  }

  static dynamic getData({required String key}) {
    return storage.read(key: key);
  }

  static Future<bool> removeData({required key}) async {
    bool isRemoved = false;
    try {
      await storage.delete(key: key);
      isRemoved = true;
    } catch (e) {
      return isRemoved;
    }
    return isRemoved;
  }

  static Future<bool> removeAll() async {
    bool isRemoveAll = false;
    try {
      await storage.deleteAll();
      isRemoveAll = true;
    } catch (e) {
      isRemoveAll = false;
    }
    return isRemoveAll;
  }

  static Future<bool> containsKey(String key) async {
    return await storage.containsKey(key: key);
  }
}
