import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/font_families.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

void showSnackBar(String text) {
  snackbarKey.currentState?.removeCurrentSnackBar();
  snackbarKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(
          fontFamily: FontFamilies.titilliumWeb,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.darkerGrey,
      behavior: SnackBarBehavior.floating,
      elevation: 6,
    ),
  );
}
