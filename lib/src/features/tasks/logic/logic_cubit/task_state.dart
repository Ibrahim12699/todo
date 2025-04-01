part of 'task_cubit.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.initial() = _Initial;

  /// create task

  const factory TaskState.createLoading() = CreateLoading;

  const factory TaskState.createSuccess(bool success) = CreateSuccess;

  const factory TaskState.createError(FirebaseException error) = CreateError;

  /// update task

  const factory TaskState.updateLoading() = UpdateLoading;

  const factory TaskState.updateSuccess(bool success) = UpdateSuccess;

  const factory TaskState.updateError(FirebaseException error) = UpdateError;
}
