import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';

class ValueAndDescription extends StatelessWidget {
  final String? value;
  final String? ifNoValue;
  final String description;
  const ValueAndDescription({
    super.key,
    required this.value,
    this.ifNoValue,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value ?? ifNoValue!,
          style: DefaultTextTheme.titilliumWebRegular16(context)!
              .copyWith(color: AppColors.white),
        ),
        Text(
          description,
          style: DefaultTextTheme.titilliumWebRegular16(context)!
              .copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
