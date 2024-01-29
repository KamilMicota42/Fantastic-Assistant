import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../widgets/buttons/default_button.dart';
import 'delete_account_email_request.dart';

void showDeleteAccount(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.darkerGrey,
        title: Text(
          'Delete Account',
          style: DefaultTextTheme.titilliumWebBold20(context),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'If you want to permanently delete Your account, and lose all your data, characters, and so on, you can click the following button (and send email to our support group that will eventually delete Your account). We are sorry to see you go.',
              style: DefaultTextTheme.titilliumWebRegular16(context),
              textAlign: TextAlign.center,
            )
          ],
        ),
        actions: <Widget>[
          DefaultButton(
            text: "Yes, I am sure",
            function: () {
              deleteAccountEmailRequest();
            },
            textStyle: DefaultTextTheme.titilliumWebBold16(context),
          ),
          DefaultButton(
            text: "Close",
            function: () {
              Navigator.of(context).pop();
            },
            textStyle: DefaultTextTheme.titilliumWebBold16(context)!.copyWith(color: AppColors.lighterGrey),
          ),
        ],
      );
    },
  );
}
