import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/commons.dart';
import 'package:todo/src/core/resources/route_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';
import 'package:todo/src/core/resources/theme/my_colors.dart';
import 'package:todo/src/core/resources/validators.dart';
import 'package:todo/src/core/widgets/custom_text_field_widget.dart';
import 'package:todo/src/core/widgets/default_button.dart';
import 'package:todo/src/features/tasks/data/model/status_model.dart';
import 'package:todo/src/features/tasks/data/model/task_model.dart';
import 'package:todo/src/features/tasks/data/repo/task_repo.dart';
import 'package:todo/src/features/tasks/logic/logic_cubit/task_cubit.dart';

class TaskDialog extends StatefulWidget {
  const TaskDialog({super.key, this.model});

  final TaskModel? model;

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ValueNotifier<StatusModel> statusNotifier = ValueNotifier(statusList[1]);
  ValueNotifier<DateTime> dateNotifier = ValueNotifier(DateTime.now());
  ValueNotifier<TimeOfDay> timeNotifier = ValueNotifier(TimeOfDay.now());
  bool loading = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    /// Set initial values if model is not null (edit task)
    if (widget.model != null) {
      titleController.text = widget.model!.title ?? '';
      descriptionController.text = widget.model!.description ?? '';
      DateTime dueDate = DateTime.fromMillisecondsSinceEpoch(
        widget.model!.dueDate ?? 0,
      );
      dateNotifier.value = dueDate;
      timeNotifier.value = TimeOfDay.fromDateTime(dueDate);
      statusNotifier.value = statusList.firstWhere(
        (element) => element.id == widget.model?.status,
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildConsumer();
  }

  Widget _buildConsumer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(24.r),
          padding: EdgeInsets.symmetric(vertical: 24.h),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: BlocConsumer<TaskCubit, TaskState>(
            listener: (BuildContext context, TaskState state) {
              switch (state) {
                case CreateSuccess _:
                  _onCreateSuccess();
                  break;
                case CreateError(:final error):
                  _onCreateError(error);
                  break;
                case CreateLoading _:
                  loading = true;
                  break;
                case UpdateSuccess _:
                  _onUpdateSuccess();
                  break;
                case UpdateError(:final error):
                  _onUpdateError(error);
                  break;
                case UpdateLoading _:
                  loading = true;
                  break;
                default:
                  break;
              }
            },
            builder: (context, state) {
              return Material(child: _buildBody());
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      color: ColorManager.white,
      width: Commons.isTablet(context) ? 0.6.sw : 0.9.sw,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 24.r, end: 8.r),
                child: Row(
                  children: [_buildTitle(), Spacer(), _buildCloseButton()],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.r),
                child: Column(
                  children: [
                    40.verticalSpace,
                    _buildTitleField(),
                    24.verticalSpace,
                    _buildDescriptionField(),
                    16.verticalSpace,
                    _buildDueDateWidget(),
                    16.verticalSpace,
                    _buildStatusWidget(),
                    24.verticalSpace,
                    _buildBottomButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.model == null ? S.current.createNewTask : S.current.editTask,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCloseButton() {
    return IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildTitleField() {
    return CustomTextFieldWidget(
      title: S.current.title,
      hint: S.current.enterTitle,
      controller: titleController,
      validator: Validators.titleValidator,
    );
  }

  Widget _buildDescriptionField() {
    return CustomTextFieldWidget(
      title: S.current.description,
      hint: S.current.enterDescription,
      minLines: 4,
      maxLines: 10,
      controller: descriptionController,
      validator: Validators.descriptionValidator,
    );
  }

  Widget _buildAddButton() {
    return DefaultButton(
      onPressed: _onActionButtonPress,
      title: widget.model == null ? S.current.createTask : S.current.updateTask,
      isLoading: loading,
    );
  }

  Widget _buildCancelButton() {
    return DefaultButton(
      onPressed: _onCancelPress,
      title: S.current.cancel,
      color: ColorManager.white,
      border: Border.all(
        color: Theme.of(context).extension<MyColors>()!.borderColor,
      ),
      textStyle: getRegularStyle(color: ColorManager.black),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [_buildAddButton(), 16.horizontalSpace, _buildCancelButton()],
    );
  }

  Widget _buildStatusWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.r),
          child: Text(
            S.current.status,
            style: getRegularStyle(color: ColorManager.black, fontSize: 16),
          ),
        ),
        8.verticalSpace,

        PopupMenuButton<StatusModel>(
          color: ColorManager.white,
          offset: Offset(-1, 40),
          onSelected: (StatusModel value) {
            statusNotifier.value = value;
          },
          itemBuilder: (BuildContext context) {
            // remove all item from statusList
            List<StatusModel> list = List.from(statusList.skip(1));
            return list.map((StatusModel status) {
              return PopupMenuItem<StatusModel>(
                value: status,
                child: Text(
                  status.title,
                  style:
                      statusNotifier.value.id == status.id
                          ? getBoldStyle(
                            color: ColorManager.primaryColor,
                            fontSize: 16,
                          )
                          : getRegularStyle(
                            color: ColorManager.black,
                            fontSize: 16,
                          ),
                ),
              );
            }).toList();
          },
          child: _buildSelectedStatus(),
        ),
      ],
    );
  }

  Widget _buildSelectedStatus() {
    return Row(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(
            top: 8.r,
            bottom: 8.r,
            start: 12.r,
            end: 6.r,
          ),
          decoration: BoxDecoration(
            color: ColorManager.backgroundColor,
            border: Border.all(
              color: Theme.of(context).extension<MyColors>()!.borderColor,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              _buildStatusText(),
              12.horizontalSpace,
              _buildArrowDownIcon(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusText() {
    return ValueListenableBuilder(
      valueListenable: statusNotifier,
      builder: (BuildContext context, StatusModel value, Widget? child) {
        return Text(
          value.title,
          style: getRegularStyle(fontSize: 16, color: ColorManager.black),
        );
      },
    );
  }

  Widget _buildArrowDownIcon() {
    return Icon(
      Icons.keyboard_arrow_down_rounded,
      color: Theme.of(context).extension<MyColors>()!.subTextColor,
    );
  }

  Widget _buildDueDateWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.r),
          child: Text(
            S.current.dueDate,
            style: getRegularStyle(color: ColorManager.black, fontSize: 16),
          ),
        ),
        8.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: ColorManager.backgroundColor,
            border: Border.all(
              color: Theme.of(context).extension<MyColors>()!.borderColor,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              _buildSelectedDateWidget(),
              Spacer(),
              _buildSelectedTimeWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedDateWidget() {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return InkWell(
      onTap: _onSelectDatePress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 12.r),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 16,
              color: Theme.of(context).extension<MyColors>()!.subTextColor,
            ),
            8.horizontalSpace,
            ValueListenableBuilder(
              valueListenable: dateNotifier,
              builder: (BuildContext context, DateTime value, Widget? child) {
                return Text(
                  formatter.format(value),
                  style: getRegularStyle(color: ColorManager.black),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedTimeWidget() {
    return InkWell(
      onTap: _onSelectTimePress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 12.r),
        child: Row(
          children: [
            Icon(
              Icons.access_time_rounded,
              size: 16,
              color: Theme.of(context).extension<MyColors>()!.subTextColor,
            ),
            8.horizontalSpace,
            ValueListenableBuilder(
              valueListenable: timeNotifier,
              builder: (BuildContext context, TimeOfDay value, Widget? child) {
                return Text(
                  value.format(context),
                  style: getRegularStyle(color: ColorManager.black),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectDatePress() {
    showDatePicker(
      context: context,
      initialDate: dateNotifier.value,
      firstDate: DateTime(2025),
      lastDate: DateTime(2026),
    ).then((value) {
      if (value != null) {
        dateNotifier.value = value;
      }
    });
  }

  void _onSelectTimePress() {
    showTimePicker(context: context, initialTime: timeNotifier.value).then((
      value,
    ) {
      if (value != null) {
        timeNotifier.value = value;
      }
    });
  }

  void _onActionButtonPress() {
    if (formKey.currentState!.validate()) {
      if (widget.model == null) {
        addTask();
      } else {
        updateTask();
      }
    }
  }

  void addTask() {
    RouteGenerator.taskCubit.createTask(
      title: titleController.text,
      description: descriptionController.text,
      status: statusNotifier.value.id,
      dueDate: DateTime(
        dateNotifier.value.year,
        dateNotifier.value.month,
        dateNotifier.value.day,
        timeNotifier.value.hour,
        timeNotifier.value.minute,
      ),
    );
  }

  void updateTask() {
    RouteGenerator.taskCubit.updateTask(
      id: widget.model!.id!,
      title: titleController.text,
      status: statusNotifier.value.id,
      description: descriptionController.text,
      dueDate: DateTime(
        dateNotifier.value.year,
        dateNotifier.value.month,
        dateNotifier.value.day,
        timeNotifier.value.hour,
        timeNotifier.value.minute,
      ),
    );
  }

  void _onCancelPress() {
    Navigator.pop(context);
  }

  void _onCreateSuccess() {
    loading = false;
    Navigator.pop(context);
  }

  void _onCreateError(FirebaseException state) {
    loading = false;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(state.message ?? '')));
  }

  void _onUpdateSuccess() {
    loading = false;
    Navigator.pop(context);
  }

  void _onUpdateError(FirebaseException state) {
    loading = false;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(state.message ?? '')));
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }
}
