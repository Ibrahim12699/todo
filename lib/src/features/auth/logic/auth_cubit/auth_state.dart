part of 'auth_cubit.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;

  /// register
  const factory AuthState.registerLoading() = RegisterLoading;

  const factory AuthState.registerSuccess(String uid) = RegisterSuccess;

  const factory AuthState.registerError(FirebaseException error) =
      RegisterError;

  /// login

  const factory AuthState.loginLoading() = LoginLoading;

  const factory AuthState.loginSuccess(String uid) = LoginSuccess;

  const factory AuthState.loginError(FirebaseException error) = LoginError;
}
