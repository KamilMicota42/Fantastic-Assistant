import 'package:flutter/material.dart';

import '../../utils/const/app_colors.dart';
import '../../utils/global_var/default_text_theme.dart';

class DefaultTextFieldWLabel extends StatelessWidget {
  const DefaultTextFieldWLabel({
    super.key,
    required this.textController,
    required this.labelText,
  });

  final TextEditingController textController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: DefaultTextTheme.titilliumWebBold20(context)!
          .copyWith(color: AppColors.darkerGrey, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: DefaultTextTheme.titilliumWebBold20(context)!
            .copyWith(color: AppColors.grey),
      ),
    );
  }
}
