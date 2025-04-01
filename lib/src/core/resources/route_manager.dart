import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/src/core/resources/injection.dart';
import 'package:todo/src/core/widgets/exception_page_error.dart';
import 'package:todo/src/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:todo/src/features/auth/presentation/screen/auth_view_screen.dart';
import 'package:todo/src/features/splash/presentation/screen/splash_screen.dart';
import 'package:todo/src/features/tasks/logic/logic_cubit/task_cubit.dart';
import 'package:todo/src/features/tasks/presentation/screen/tasks_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String splashRoute = '/';
  static const String authRoute = '/auth';
  static const String tasksRoute = '/tasks';
}

class RouteGenerator {
  static late AuthCubit authCubit;
  static late TaskCubit taskCubit;

  RouteGenerator() {
    authCubit = getIt<AuthCubit>();
    taskCubit = getIt<TaskCubit>();
  }

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.splashRoute,
    errorBuilder: (context, state) {
      return const ExceptionPageError();
    },
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splashRoute,
        name: Routes.splashRoute,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: Routes.authRoute,
        name: Routes.authRoute,
        builder: (context, state) {
          return BlocProvider.value(
            value: authCubit,
            child: const AuthViewScreen(),
          );
        },
      ),

      GoRoute(
        path: Routes.tasksRoute,
        name: Routes.tasksRoute,
        builder: (context, state) {
          return const TasksScreen();
        },
      ),
    ],
  );
}
