import 'package:flutter/material.dart';

import '../../utils/const/app_colors.dart';
import '../../utils/global_var/default_text_theme.dart';

class DefaultTextFieldWLabel extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final TextAlign? alignText;
  final FloatingLabelAlignment? alignLabel;
  final TextInputType? keyboardType;
  final Function? onChanged;
  const DefaultTextFieldWLabel({
    super.key,
    required this.textController,
    required this.labelText,
    this.alignText,
    this.alignLabel,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      textAlign: alignText ?? TextAlign.start,
      style: DefaultTextTheme.titilliumWebBold20(context)!
          .copyWith(color: AppColors.darkerGrey, fontWeight: FontWeight.bold),
      keyboardType: keyboardType,
      onChanged: (value) {
        onChanged != null ? onChanged!(value) : null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelAlignment: alignLabel ?? FloatingLabelAlignment.start,
        labelStyle: DefaultTextTheme.titilliumWebBold20(context)!
            .copyWith(color: AppColors.grey),
      ),
    );
  }
}
