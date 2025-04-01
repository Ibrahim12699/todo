import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/src/core/resources/style_manager.dart';
import 'package:todo/src/core/resources/theme/my_colors.dart';

class AgreeTermsWidget extends StatelessWidget {
  const AgreeTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Text(
        S.current.agree_terms,
        style: getRegularStyle(
          color: Theme.of(context).extension<MyColors>()!.subTextColor,
          fontSize: 13,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
