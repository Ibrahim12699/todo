import 'package:get_it/get_it.dart';
import 'package:todo/src/features/auth/data/repo/auth_repo.dart';
import 'package:todo/src/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:todo/src/features/tasks/data/repo/task_repo.dart';
import 'package:todo/src/features/tasks/logic/logic_cubit/task_cubit.dart';

final getIt = GetIt.instance;

Future initGetIt() async {
  getIt.allowReassignment = true;

  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));

  getIt.registerLazySingleton<TaskRepo>(() => TaskRepo());
  getIt.registerLazySingleton<TaskCubit>(() => TaskCubit(getIt()));
}
