import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';

class DescriptionLeft extends StatelessWidget {
  final String text;
  const DescriptionLeft({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: DefaultTextTheme.titilliumWebRegular16(context)!
            .copyWith(color: AppColors.white, overflow: TextOverflow.visible),
      ),
    );
  }
}
