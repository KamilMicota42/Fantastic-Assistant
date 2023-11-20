import 'package:flutter/material.dart';

import '../../../../../utils/global_var/default_text_theme.dart';

class LeftMidRightTitleRow extends StatelessWidget {
  const LeftMidRightTitleRow({
    super.key,
    required this.textLeft,
    required this.textMid,
    required this.textRight,
  });

  final String textLeft;
  final String textMid;
  final String textRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textLeft,
              style: DefaultTextTheme.titilliumWebBold20(context),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              textMid,
              style: DefaultTextTheme.titilliumWebBold20(context),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              textRight,
              style: DefaultTextTheme.titilliumWebBold20(context),
            ),
          ),
        ),
      ],
    );
  }
}
