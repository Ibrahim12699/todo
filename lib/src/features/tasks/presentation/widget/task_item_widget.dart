import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/core/resources/assets_manager.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/route_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';
import 'package:todo/src/core/resources/theme/my_colors.dart';
import 'package:todo/src/features/tasks/data/model/task_model.dart';
import 'package:todo/src/features/tasks/presentation/widget/task_dialog.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key, required this.model});

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        bottom: 16.r,
        start: 16.r,
        end: 8.r,
        top: 10.r,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildStatusWidget(),
                    Spacer(),
                    Row(
                      children: [
                        _buildEditButton(context),
                        _buildDeleteButton(),
                      ],
                    ),
                  ],
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 4.r, end: 8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(),
                      6.verticalSpace,
                      _buildDescription(context),
                      10.verticalSpace,
                      Row(
                        children: [
                          _buildDateWidget(context),
                          Spacer(),
                          _buildActionButtons(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateWidget(context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(model.dueDate ?? 1);
    DateFormat formatter = DateFormat('MMM dd, mm:hh a');
    return Row(
      children: [
        Icon(
          Icons.access_time_rounded,
          size: 12.r,
          color: Theme.of(context).extension<MyColors>()!.subTextColor,
        ),
        4.horizontalSpace,
        Text(
          formatter.format(date),
          style: getRegularStyle(
            fontSize: 11,
            color: Theme.of(context).extension<MyColors>()!.subTextColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(model.title ?? '', style: getSemiBoldStyle(fontSize: 16));
  }

  Widget _buildStatusWidget() {
    return Container(
      margin: EdgeInsets.only(top: 8.r),
      padding: EdgeInsets.symmetric(vertical: 4.r, horizontal: 10.r),
      decoration: BoxDecoration(
        color: _getStatusColor(),
        borderRadius: BorderRadius.circular(60.r),
      ),
      child: Text(
        _getTextStatusText(),
        style: getRegularStyle(fontSize: 12, color: _getTextStatusColor()),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return InkWell(
      onTap: () => _onDeletePress(),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 10.r,
          bottom: 8.r,
          end: 8.r,
          start: 6.r,
        ),
        child: SvgPicture.asset(
          AssetsManager.deleteButton,
          height: 16.r,
          width: 16.r,
        ),
      ),
    );
  }

  Widget _buildEditButton(context) {
    return InkWell(
      onTap: () => _onEditPress(context),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: 10.r,
          bottom: 8.r,
          start: 8.r,
          end: 6.r,
        ),
        child: SvgPicture.asset(
          AssetsManager.editButton,
          height: 16.r,
          width: 16.r,
        ),
      ),
    );
  }

  Widget _buildDescription(context) {
    return Text(
      model.description ?? '',
      style: getRegularStyle(
        color: Theme.of(context).extension<MyColors>()!.subTextColor,
      ),
    );
  }

  Widget _buildActionButtons() {
    return Visibility(
      visible: model.status != 'completed',
      child: InkWell(
        onTap: _onActionPress,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 6.r),
          decoration: BoxDecoration(
            color: ColorManager.backgroundColor,

            borderRadius: BorderRadius.circular(60.r),
          ),
          child: Row(
            children: [
              _buildCheckIcon(),
              8.horizontalSpace,
              _buildActionText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckIcon() {
    return Icon(Icons.check, size: 16.r);
  }

  Widget _buildActionText() {
    String title = '';
    if (model.status == 'todo') {
      title = 'Start';
    } else if (model.status == 'inProgress') {
      title = 'Complete';
    }
    return Text(title, style: getRegularStyle(fontSize: 12));
  }

  Color _getStatusColor() {
    Color color = ColorManager.white;
    if (model.status == 'completed') {
      color = ColorManager.greenBg;
    } else if (model.status == 'inProgress') {
      color = ColorManager.amberBg;
    } else if (model.status == 'todo') {
      color = ColorManager.blueBg;
    }

    return color;
  }

  Color _getTextStatusColor() {
    Color color = ColorManager.white;
    if (model.status == 'completed') {
      color = ColorManager.green;
    } else if (model.status == 'inProgress') {
      color = ColorManager.amber;
    } else if (model.status == 'todo') {
      color = ColorManager.blue;
    }

    return color;
  }

  String _getTextStatusText() {
    String title = '';
    if (model.status == 'completed') {
      title = "Completed";
    } else if (model.status == 'inProgress') {
      title = "In Progress";
    } else if (model.status == 'todo') {
      title = "To Do";
    }

    return title;
  }

  void _onActionPress() {
    if (model.status == 'todo') {
      RouteGenerator.taskCubit.updateTaskStatus(model.id, 'inProgress');
    } else if (model.status == 'inProgress') {
      RouteGenerator.taskCubit.updateTaskStatus(model.id, 'completed');
    }
  }

  void _onEditPress(context) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: RouteGenerator.taskCubit,
          child: TaskDialog(model: model),
        );
      },
    );
  }

  void _onDeletePress() {
    RouteGenerator.taskCubit.deleteTask(model.id);
  }
}
