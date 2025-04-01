import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/src/core/web_services/api_result.dart';
import 'package:todo/src/features/tasks/data/repo/task_repo.dart';

part 'task_state.dart';

part 'task_cubit.freezed.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepo) : super(const TaskState.initial());

  TaskRepo taskRepo;

  void createTask({
    required String title,
    required String description,
    required String status,
    required DateTime dueDate,
  }) async {
    emit(const TaskState.createLoading());
    var result = await taskRepo.createTask(
      title: title,
      description: description.trim(),
      status: status,
      dateTime: dueDate,
    );

    switch (result) {
      case Success(:final data):
        emit(TaskState.createSuccess(data));
        break;
      case Failure(:final networkExceptions):
        emit(TaskState.createError(networkExceptions));
        break;
    }
  }

  void updateTask({
    required String id,
    required String title,
    required String description,
    required String status,
    required DateTime dueDate,
  }) async {
    emit(const TaskState.updateLoading());
    var result = await taskRepo.updateTask(
      id: id,
      title: title,
      description: description.trim(),
      status: status,
      dueDate: dueDate,
    );

    switch (result) {
      case Success(:final data):
        emit(TaskState.updateSuccess(data));
        break;
      case Failure(:final networkExceptions):
        emit(TaskState.updateError(networkExceptions));
        break;
    }
  }

  void deleteTask(String? id) {
    taskRepo.deleteTask(id);
  }

  void updateTaskStatus(String? id, String value) {
    taskRepo.updateTaskStatus(id, value);
  }
}
