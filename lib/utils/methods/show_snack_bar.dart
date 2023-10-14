import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.darkerGrey,
      behavior: SnackBarBehavior.floating,
      elevation: 6,
    ),
  );
}
