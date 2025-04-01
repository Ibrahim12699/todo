import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/core/resources/commons.dart';
import 'package:todo/src/features/tasks/data/model/status_model.dart';
import 'package:todo/src/features/tasks/data/model/task_model.dart';
import 'package:todo/src/features/tasks/presentation/widget/empty_tasks_widget.dart';
import 'package:todo/src/features/tasks/presentation/widget/task_item_widget.dart'
    show TaskItemWidget;

class TasksWidget extends StatelessWidget {
  const TasksWidget({super.key, required this.statusNotifier});

  final ValueNotifier<StatusModel> statusNotifier;

  @override
  Widget build(BuildContext context) {
    return _buildStreamBuilder();
  }

  Widget _buildStreamBuilder() {
    List<TaskModel> taskList = [];

    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance
              .collection('tasks')
              .where(
                'status',
                isEqualTo:
                    statusNotifier.value.id == 'all'
                        ? null
                        : statusNotifier.value.id,
              )
              .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${S.current.error}: ${snapshot.error}");
        }

        taskList =
            snapshot.data?.docs
                .map((DocumentSnapshot doc) => TaskModel.fromFirestore(doc))
                .toList() ??
            [];

        return taskList.isEmpty
            ? Expanded(
              child: Center(
                child: EmptyTasksWidget(model: statusNotifier.value),
              ),
            )
            : Expanded(
              child:
                  Commons.isTablet(context)
                      ? _buildTaskGrid(taskList)
                      : _buildTaskList(taskList),
            );
      },
    );
  }

  Widget _buildTaskList(List<TaskModel> list) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 6.r,
        bottom: 150.h,
      ),
      itemCount: list.length,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return TaskItemWidget(model: list[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return 16.verticalSpace;
      },
    );
  }

  Widget _buildTaskGrid(List<TaskModel> list) {
    return GridView.builder(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 6.r,
        bottom: 150.h,
      ),
      itemCount: list.length,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return TaskItemWidget(model: list[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.r,
        mainAxisSpacing: 16.r,
        childAspectRatio: 1.5,
      ),
    );
  }
}
