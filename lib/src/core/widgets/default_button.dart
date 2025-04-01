import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.title,
    this.width,
    this.onPressed,
    this.color,
    this.isLoading,
    this.padding,
    this.textStyle,
    this.collapse,
    this.isDisabled,
    this.onDisabledPressed,
    this.radius,
    this.border,
  });

  final String title;
  final double? width;
  final Color? color;
  final void Function()? onPressed;
  final bool? isLoading;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool? collapse;
  final bool? isDisabled;
  final Function? onDisabledPressed;
  final double? radius;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      borderRadius: BorderRadius.circular(8.r),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: collapse == true ? 0 : 1,
            child: Container(
              constraints: BoxConstraints(maxWidth: width ?? double.infinity),
              padding:
                  padding ??
                  EdgeInsets.symmetric(horizontal: 20.r, vertical: 12.r),
              decoration: BoxDecoration(
                border: border,
                color:
                    isDisabled == true
                        ? ColorManager.disabledColor
                        : color ?? Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(radius ?? 10.r),
              ),
              child: Center(
                child:
                    isLoading == true ? _buildLoading() : _buildTitle(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return SizedBox(
      height: 18.r,
      width: 18.r,
      child: CircularProgressIndicator(
        color: ColorManager.white,
        strokeWidth: 1.5.h,
      ),
    );
  }

  Widget _buildTitle(context) {
    return Text(
      title,
      style:
          textStyle ??
          getMediumStyle(
            color:
                isDisabled == true
                    ? ColorManager.disabledTextColor
                    : Theme.of(context).scaffoldBackgroundColor,

          ),
    );
  }

  void _onPressed() {
    if (onPressed != null) {
      if (isDisabled == true) {
        onDisabledPressed!();
      } else {
        if (isLoading != true) {
          onPressed!();
        }
      }
    }
  }
}
