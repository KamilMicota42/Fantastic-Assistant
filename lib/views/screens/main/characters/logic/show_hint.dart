import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:flutter/material.dart';

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
    title: Text(
      'Hint',
      style: DefaultTextTheme.titilliumWebBold20(context),
      textAlign: TextAlign.center,
    ),
    content: Text(
      hintText,
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
