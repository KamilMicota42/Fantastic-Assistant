import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../widgets/buttons/default_button.dart';

void showHint(BuildContext context, String hintText) async {
  context.mounted
      ? showDialog(
          context: context,
          builder: (BuildContext context) => _hintPopUp(
            context,
            hintText,
          ),
        )
      : null;
}

Widget _hintPopUp(
  BuildContext context,
  String hintText,
) {
  return AlertDialog(
    backgroundColor: AppColors.darkerGrey,
    title: Text(
      'Hint',
      style: DefaultTextTheme.titilliumWebBold20(context),
      textAlign: TextAlign.center,
    ),
    content: SingleChildScrollView(
      child: Text(
        hintText,
        style: DefaultTextTheme.titilliumWebBold16(context)!
            .copyWith(color: AppColors.lighterGrey),
      ),
    ),
    actions: <Widget>[
      DefaultButton(
        text: "Close",
        function: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
