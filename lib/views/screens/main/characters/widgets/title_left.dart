import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';

class TitleLeft extends StatelessWidget {
  final String text;
  final AlignmentGeometry? alignment;
  const TitleLeft({
    super.key,
    required this.text,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(
        text,
        style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.black),
      ),
    );
  }
}
