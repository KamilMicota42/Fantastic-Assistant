import 'package:flutter/material.dart';

class DefaultTextTheme {
  static TextStyle? titilliumWebBold22(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge;
  static TextStyle? titilliumWebBold20(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;
  static TextStyle? titilliumWebBold16(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall;
  static TextStyle? titilliumWebRegular16(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge;
  static TextStyle? titilliumWebRegular13(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;
  static TextStyle? titilliumWebRegular12(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;
}
