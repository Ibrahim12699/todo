import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/features/tasks/data/model/status_model.dart';
import 'package:todo/src/features/tasks/presentation/widget/status_widget.dart';

class StatusListWidget extends StatelessWidget {
  const StatusListWidget({
    super.key,
    required this.statusNotifier,
    required this.onSelectedStatus,
  });

  final ValueNotifier<StatusModel> statusNotifier;
  final Function(StatusModel) onSelectedStatus;

  @override
  Widget build(BuildContext context) {
    return _buildTabBar();
  }

  Widget _buildTabBar() {
    return StreamBuilder<QuerySnapshot>(
      stream: _taskStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _buildErrorWidget();
        }

        final updatedStatusList = _calculateStatusCounts(snapshot.data);
        return _buildStatusList(updatedStatusList);
      },
    );
  }

  /// Fetches the FireStore collection stream
  Stream<QuerySnapshot> _taskStream() {
    return FirebaseFirestore.instance.collection('tasks').snapshots();
  }

  /// Calculates the count for each status type
  List<StatusModel> _calculateStatusCounts(QuerySnapshot? data) {
    final allTasks = data?.docs ?? [];

    final int allCount = allTasks.length;
    final int completedCount =
        allTasks.where((doc) => doc['status'] == 'completed').length;
    final int inProgressCount =
        allTasks.where((doc) => doc['status'] == 'inProgress').length;
    final int todoCount =
        allTasks.where((doc) => doc['status'] == 'todo').length;

    return [
      StatusModel(id: 'all', title: S.current.all, count: allCount),
      StatusModel(id: 'todo', title: S.current.todo, count: todoCount),
      StatusModel(
        id: 'inProgress',
        title: S.current.inProgress,
        count: inProgressCount,
      ),
      StatusModel(
        id: 'completed',
        title: S.current.completed,
        count: completedCount,
      ),
    ];
  }

  /// Builds the horizontal scrolling list of status widgets
  Widget _buildStatusList(List<StatusModel> updatedStatusList) {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        scrollDirection: Axis.horizontal,
        itemCount: updatedStatusList.length,
        itemBuilder: (context, index) {
          return StatusWidget(
            model: updatedStatusList[index],
            selectedModel: statusNotifier.value,
            onSelected: onSelectedStatus,
          );
        },
        separatorBuilder: (context, index) => 10.horizontalSpace,
      ),
    );
  }

  /// Displays an error message in case of failure
  Widget _buildErrorWidget() {
    return Center(child: Text(S.current.noTasksFound));
  }
}
