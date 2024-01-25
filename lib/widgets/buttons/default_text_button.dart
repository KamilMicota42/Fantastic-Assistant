import 'package:flutter/material.dart';

import '../../utils/const/app_colors.dart';
import '../../utils/global_var/default_text_theme.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const DefaultTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(AppColors.lighterIris.withOpacity(0.1)),
      ),
      child: Text(
        text,
        style: DefaultTextTheme.titilliumWebBold16(context)!.copyWith(color: AppColors.white),
      ),
    );
  }
}
