import 'package:flutter/material.dart';

import '../../utils/const/app_colors.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      color: AppColors.darkerGrey,
    );
  }
}
