import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/src/core/resources/style_manager.dart';
import 'package:todo/src/core/widgets/default_text_field_widget.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.title,
    required this.hint,
    this.subTitle,
    this.subTitleStyle,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.validator,
    this.inputFormatters,
    this.fillColor,
    this.isPassword,
  });

  final String title;
  final String? subTitle;
  final String hint;
  final TextStyle? subTitleStyle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final List<FilteringTextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildLabel(), 10.verticalSpace, _buildTextField()],
    );
  }

  Widget _buildLabel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: Text(title, textAlign: TextAlign.start, style: getMediumStyle()),
    );
  }

  Widget _buildTextField() {
    return DefaultTextFieldWidget(
      hint: hint,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      inputFormatters: inputFormatters,
      fillColor: fillColor,
      isPassword: isPassword,
    );
  }
}
