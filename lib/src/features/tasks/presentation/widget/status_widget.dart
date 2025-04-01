import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';
import 'package:todo/src/core/resources/theme/my_colors.dart';
import 'package:todo/src/features/tasks/data/model/status_model.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required this.model,
    this.selectedModel,
    required this.onSelected,
  });

  final StatusModel model;
  final StatusModel? selectedModel;
  final Function(StatusModel) onSelected;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onSelected(model);
          },
          borderRadius: BorderRadius.circular(60.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 7.r, horizontal: 14.r),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    isSelected() == true
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).extension<MyColors>()!.borderColor,
              ),
              color:
                  isSelected() == true
                      ? Theme.of(context).primaryColor
                      : ColorManager.white,
              borderRadius: BorderRadius.circular(60.r),
            ),
            child: Row(children: [_buildText(), _buildCount()]),
          ),
        ),
      ],
    );
  }

  Widget _buildText() {
    return Text(
      model.title,
      style:
          isSelected()
              ? getBoldStyle(color: ColorManager.white)
              : getSemiBoldStyle(color: ColorManager.black),
    );
  }

  Widget _buildCount() {
    return Visibility(
      visible: model.count != null && model.count! > 0,
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 12.r),
        padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 2.r),
        decoration: BoxDecoration(
          color:
              isSelected()
                  ? ColorManager.white.withValues(alpha: 0.2)
                  : ColorManager.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          "${model.count ?? 0}",
          style: getRegularStyle(
            color: isSelected() ? ColorManager.white : ColorManager.black,
          ),
        ),
      ),
    );
  }

  bool isSelected() {
    return model.id == selectedModel?.id;
  }
}
