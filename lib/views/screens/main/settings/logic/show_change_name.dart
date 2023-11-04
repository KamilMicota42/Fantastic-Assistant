import 'package:fantastic_assistant/services/api/settings/firebase_database_user_data.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../services/api/auth/firebase_auth_methods.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../widgets/buttons/default_button.dart';
import '../../../../../widgets/input/default_text_field_w_label.dart';

void showChangeName(BuildContext context) {
  TextEditingController newDisplayNameController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Change Display Name',
          style: DefaultTextTheme.titilliumWebBold20(context),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DefaultTextFieldWLabel(
              textController: newDisplayNameController,
              labelText: 'New Display Name',
            ),
          ],
        ),
        actions: <Widget>[
          DefaultButton(
            text: "Save",
            function: () {
              //AUTH DISPLAY NAME CHANGE
              FirebaseAuthMethods(FirebaseAuth.instance).changeAuthDisplayName(
                newDisplayName: newDisplayNameController.text,
              );
              //FIREBASE DATABASE DISPLAY NAME CHANGE
              changeUserDisplayName(
                getIt<CurrentUserAdditionalData>().state!.accountId!,
                newDisplayNameController.text,
              );
            },
          ),
          DefaultButton(
            text: "Close",
            function: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
