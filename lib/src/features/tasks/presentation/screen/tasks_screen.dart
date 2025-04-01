import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/route_manager.dart';
import 'package:todo/src/features/tasks/data/model/status_model.dart';
import 'package:todo/src/features/tasks/data/repo/task_repo.dart';
import 'package:todo/src/features/tasks/presentation/widget/home_greeting_widget.dart';
import 'package:todo/src/features/tasks/presentation/widget/status_list_widget.dart';
import 'package:todo/src/features/tasks/presentation/widget/task_dialog.dart';
import 'package:todo/src/features/tasks/presentation/widget/tasks_app_bar.dart';
import 'package:todo/src/features/tasks/presentation/widget/tasks_list_widget.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  ValueNotifier<StatusModel> statusNotifier = ValueNotifier(statusList[0]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: TasksAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildBody() {
    return ValueListenableBuilder(
      valueListenable: statusNotifier,
      builder: (BuildContext context, StatusModel value, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeGreetingWidget(),
            12.verticalSpace,
            StatusListWidget(
              statusNotifier: statusNotifier,
              onSelectedStatus: _onSelectedStatus,
            ),
            TasksWidget(statusNotifier: statusNotifier),
          ],
        );
      },
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _onAddTaskPress,
      shape: CircleBorder(),
      child: Icon(Icons.add),
    );
  }

  void _onSelectedStatus(StatusModel model) {
    statusNotifier.value = model;
  }

  void _onAddTaskPress() {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: RouteGenerator.taskCubit,
          child: TaskDialog(),
        );
      },
    );
  }
}
