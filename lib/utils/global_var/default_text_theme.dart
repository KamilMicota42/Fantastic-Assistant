import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultTextTheme {
  static TextStyle? titilliumWebBold22(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.white);
  static TextStyle? titilliumWebBold20(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white);
  static TextStyle? titilliumWebBold16(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.white);
  static TextStyle? titilliumWebRegular16(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.white);
  static TextStyle? titilliumWebRegular13(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white);
  static TextStyle? titilliumWebRegular12(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.white);
}
