import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/src/core/resources/assets_manager.dart';
import 'package:todo/src/core/resources/color_manager.dart';
import 'package:todo/src/core/resources/style_manager.dart';
import 'package:todo/src/core/resources/theme/my_colors.dart';

class DefaultTextFieldWidget extends StatefulWidget {
  const DefaultTextFieldWidget({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.validator,
    this.inputFormatters,
    this.minLines,
    this.fillColor,
    this.isPassword,
  });

  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<FilteringTextInputFormatter>? inputFormatters;
  final bool? isPassword;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;

  @override
  State<DefaultTextFieldWidget> createState() => _DefaultTextFieldWidgetState();
}

class _DefaultTextFieldWidgetState extends State<DefaultTextFieldWidget> {
  ValueNotifier<bool> obscureTextNotifier = ValueNotifier(true);
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obscureTextNotifier,
      builder: (BuildContext context, bool obscureText, Widget? child) {
        return TextFormField(
          focusNode: focusNode,
          obscureText: widget.isPassword == true ? obscureText : false,

          onTapOutside: (event) => focusNode.unfocus(),
          validator: widget.validator,
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          style: getRegularStyle(),
          minLines: widget.minLines,
          maxLines: widget.maxLines ?? 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 12.h,
            ),
            suffixIcon: _buildSuffixIcon(obscureText),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 22.r,
              maxWidth: 44.r,
            ),
            hintText: widget.hint,
            fillColor: widget.fillColor ?? ColorManager.fillColor,
            filled: true,
            border: _border(),
            enabledBorder: _border(),
            focusedBorder: _border(),
            disabledBorder: _border(),
            errorBorder: _border(borderColor: ColorManager.errorColor),
            focusedErrorBorder: _border(borderColor: ColorManager.errorColor),
            hintStyle: getRegularStyle(color: Theme.of(context).hintColor),
          ),
        );
      },
    );
  }

  InputBorder _border({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color:
            borderColor ?? Theme.of(context).extension<MyColors>()!.borderColor,
      ),
    );
  }

  Widget? _buildSuffixIcon(obscureText) {
    if (widget.isPassword == true) {
      return _buildVisibilityIcon(obscureText);
    } else {
      return null;
    }
  }

  Widget _buildVisibilityIcon(bool obscureText) {
    return GestureDetector(
      onTap: () {
        obscureTextNotifier.value = !obscureTextNotifier.value;
      },
      child: Row(
        children: [
          SvgPicture.asset(
            obscureText ? AssetsManager.eyeOff : AssetsManager.eye,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
