import 'package:flutter/material.dart';

import '../../../../utils/global_var/default_text_theme.dart';
import '../../../../widgets/buttons/default_text_button.dart';

class TextAndClickableTextRow extends StatelessWidget {
  final String contentText;
  final String clickableContentText;
  final Function function;
  const TextAndClickableTextRow({
    super.key,
    required this.contentText,
    required this.clickableContentText,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            contentText,
            style: DefaultTextTheme.titilliumWebRegular16(context),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: DefaultTextButton(
            text: clickableContentText,
            onPressed: () {
              function();
            },
          ),
        ),
      ],
    );
  }
}
