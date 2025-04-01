import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/src/core/web_services/api_result.dart';
import 'package:todo/src/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(const AuthState.initial()) {
    authRepo.init();
  }

  AuthRepo authRepo;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(const AuthState.registerLoading());
    String? deviceToken = await messaging.getToken();

    return authRepo
        .register(
          fullName: fullName,
          email: email,
          password: password,
          deviceToken: deviceToken,
        )
        .then((value) {
          switch (value) {
            case Success(:final data):
              emit(AuthState.registerSuccess(data));
              break;
            case Failure(:final networkExceptions):
              emit(AuthState.registerError(networkExceptions));
              break;
          }
        });
  }

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loginLoading());
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      messaging.requestPermission();
      String? deviceToken = await messaging.getToken();

      return authRepo
          .login(email: email, password: password, deviceToken: deviceToken)
          .then((value) {
            switch (value) {
              case Success(:final data):
                emit(AuthState.loginSuccess(data));
                break;
              case Failure(:final networkExceptions):
                emit(AuthState.loginError(networkExceptions));
                break;
            }
          });
    } catch (error, stacktrace) {
      log("login error: $error", stackTrace: stacktrace);
      emit(
        AuthState.loginError(
          FirebaseException(
            plugin: 'firebase_auth',
            code: 'ERROR_INVALID_CREDENTIAL',
            message: error.toString(),
            stackTrace: stacktrace,
          ),
        ),
      );
    }
  }
}
