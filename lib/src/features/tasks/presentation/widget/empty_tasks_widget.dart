import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/core/resources/assets_manager.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';
import 'package:todo/src/core/resources/theme/my_colors.dart';
import 'package:todo/src/features/tasks/data/model/status_model.dart';

class EmptyTasksWidget extends StatelessWidget {
  const EmptyTasksWidget({super.key, required this.model});

  final StatusModel model;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(),
        24.verticalSpace,
        _buildTitle(),
        10.verticalSpace,
        _buildSubtitle(context),
        100.verticalSpace,
      ],
    );
  }

  Widget _buildIcon() {
    return Container(
      height: 70.r,
      width: 70.r,
      decoration: BoxDecoration(
        color: ColorManager.liteGrey,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(AssetsManager.save, height: 32.r, width: 32.r),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(S.current.noTasksFound, style: getMediumStyle(fontSize: 18));
  }

  Widget _buildSubtitle(context) {
    return Text(
      subtitle,
      style: getRegularStyle(
        color: Theme.of(context).extension<MyColors>()!.subTextColor,
      ),
    );
  }

  String get subtitle {
    if (model.id == 'all') {
      return S.current.youHaventCreatedAnyTasksYet;
    } else {
      return S.current.noTasksWithStatusFound(model.title);
    }
  }
}
