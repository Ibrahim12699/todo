import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/src/features/auth/data/model/auth_type_model.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';
import 'package:todo/src/core/resources/theme/my_colors.dart';
import 'package:todo/src/features/auth/data/repo/auth_repo.dart';

class AuthSwitchBtn extends StatelessWidget {
  const AuthSwitchBtn({
    super.key,
    this.selectedAuthType,
    required this.onItemPressed,
  });

  final AuthTypeModel? selectedAuthType;
  final Function(AuthTypeModel) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r),
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        color: ColorManager.liteGrey,
        border: Border.all(
          width: 1.r,
          color: Colors.white.withValues(alpha: 0.1),
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(children: authTypes.map((e) => _buildItem(e, context)).toList()),
    );
  }

  Widget _buildItem(AuthTypeModel e ,BuildContext context) {
    final bool isSelected = selectedAuthType?.id == e.id;

    return Expanded(
      child: InkWell(
        onTap: () => onItemPressed(e),
        borderRadius: BorderRadius.circular(50.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6.r),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? ColorManager.white : Colors.transparent,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Text(
            e.name ?? '',
            style:
                isSelected
                    ? getMediumStyle(color: Colors.black)
                    : getRegularStyle(color: Theme.of(context).extension<MyColors>()!.subTextColor),
          ),
        ),
      ),
    );
  }
}
