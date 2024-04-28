import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/const/app_colors.dart';
import '../../utils/global_var/default_text_theme.dart';

class DefaultTextFieldWLabel extends StatelessWidget {
  final TextEditingController? textController;
  final String labelText;
  final Color? labelColor;
  final TextAlign? alignText;
  final FloatingLabelAlignment? alignLabel;
  final TextInputType? keyboardType;
  final Function? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Icon? suffixIcon;
  const DefaultTextFieldWLabel({
    super.key,
    this.textController,
    required this.labelText,
    this.labelColor,
    this.alignText,
    this.alignLabel,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      textAlign: alignText ?? TextAlign.start,
      style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(
        color: AppColors.semiWhite,
        fontWeight: FontWeight.bold,
      ),
      keyboardType: keyboardType,
      onChanged: (value) {
        onChanged != null ? onChanged!(value) : null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelAlignment: alignLabel ?? FloatingLabelAlignment.start,
        labelStyle: DefaultTextTheme.titilliumWebBold20(context)!
            .copyWith(color: labelColor ?? AppColors.greenWhite),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.semiWhite,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
      inputFormatters: inputFormatters,
    );
  }
}
