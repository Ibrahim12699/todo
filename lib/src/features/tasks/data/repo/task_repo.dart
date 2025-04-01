import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/core/web_services/api_result.dart';
import 'package:todo/src/features/tasks/data/model/status_model.dart';

class TaskRepo {
  List<StatusModel> getStatusList() {
    return statusList;
  }

  Future<ApiResult<bool>> createTask({
    required String title,
    required String description,
    required String status,
    required DateTime dateTime,
  }) async {
    CollectionReference collection = FirebaseFirestore.instance.collection(
      'tasks',
    );

    try {
      Map<String, dynamic> task = {
        'status': status,
        'title': title,
        "description": description,
        'due_date': dateTime.millisecondsSinceEpoch,
      };
      bool state = false;
      await collection.add(task).whenComplete(() {
        state = true;
      });
      return ApiResult.success(state);
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

  void deleteTask(String? id) {
    FirebaseFirestore.instance.collection('tasks').doc(id).delete();
  }

  Future<ApiResult<bool>> updateTask({
    required String id,
    required String title,
    required String description,
    required String status,
    required DateTime dueDate,
  }) async {
    try {
      Map<String, dynamic> task = {
        'title': title,
        'description': description,
        'status': status,
        'due_date': dueDate.millisecondsSinceEpoch,
      };
      bool state = false;
      CollectionReference collection = FirebaseFirestore.instance.collection(
        'tasks',
      );

      final DocumentReference documentReference = collection.doc(id);
      await documentReference.update(task).whenComplete(() {
        state = true;
      });
      return ApiResult.success(state);
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

  Future<ApiResult<bool>> updateTaskStatus(
    String? id,
    String status,
  ) async {
    try {
      Map<String, dynamic> task = {'status': status};
      bool state = false;
      CollectionReference collection = FirebaseFirestore.instance.collection(
        'tasks',
      );

      final DocumentReference documentReference = collection.doc(id);
      documentReference.update(task).whenComplete(() {
        state = true;
      });
      return ApiResult.success(state);
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
}

List<StatusModel> statusList = [
  StatusModel(id: 'all', title: S.current.all),
  StatusModel(id: 'todo', title: S.current.todo),
  StatusModel(id: 'inProgress', title: S.current.inProgress),
  StatusModel(id: 'completed', title: S.current.completed),
];
