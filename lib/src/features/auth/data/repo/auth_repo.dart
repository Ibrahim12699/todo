import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/features/auth/data/model/auth_type_model.dart';
import 'package:todo/src/core/web_services/api_result.dart';

late final FirebaseAuth auth;

class AuthRepo {
  Future<void> init() async {
    auth = FirebaseAuth.instance;
  }

  Future<ApiResult<String>> register({
    required String fullName,
    required String email,
    required String password,
    String? deviceToken,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      insertUser(
        uid: userCredential.user!.uid,
        fullName: fullName,
        email: email,
        password: password,
        deviceToken: deviceToken,
      );

      return ApiResult.success(userCredential.user!.uid);
    } catch (error, stacktrace) {
      return ApiResult.failure(
        FirebaseException(
          plugin: 'firebase_auth',
          code: 'ERROR_INVALID_CREDENTIAL',
          message: error.toString(),
          stackTrace: stacktrace,
        ),
      );
    }
  }

  Future<bool> insertUser({
    required String uid,
    required String fullName,
    required String email,
    required String password,
    String? deviceToken,
  }) async {
    CollectionReference collection = FirebaseFirestore.instance.collection(
      'user',
    );

    Map<String, dynamic> user = {
      'full_name': fullName,
      'email': email,
      'password': password,
      'fcm_token': deviceToken,
    };
    bool state = false;
    await collection
        .doc(uid)
        .set(user)
        .whenComplete(() {
          state = true;
        })
        .onError((error, stacktrace) {
          state = false;
        });

    return state;
  }

  Future<ApiResult<String>> login({
    required String email,
    required String password,
    String? deviceToken,
  }) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (deviceToken != null) {
        updateFcmToken(uid: userCredential.user!.uid, fcmToken: deviceToken);
      }
      return ApiResult.success(userCredential.user!.uid);
    } catch (error) {
      return ApiResult.failure(
        FirebaseException(
          plugin: 'firebase_auth',
          code: 'ERROR_INVALID_CREDENTIAL',
          message: error.toString(),
        ),
      );
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  void updateFcmToken({required String uid, String? fcmToken}) {
    FirebaseFirestore.instance.collection('user').doc(uid).update({
      'fcm_token': fcmToken,
    });
  }
}

final List<AuthTypeModel> authTypes = [
  AuthTypeModel(id: 'login', name: S.current.login),
  AuthTypeModel(id: 'register', name: S.current.register),
];
