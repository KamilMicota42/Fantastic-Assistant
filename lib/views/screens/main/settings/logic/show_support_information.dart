import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../settings/injection.dart';
import '../../../../../widgets/buttons/default_button.dart';
import '../../../inital_loading/cubits/firebase_auth_current_user_uid.dart';

void showSupportInformation(BuildContext context) async {
  String? systemName;
  String? systemVersion;
  String? deviceName;
  String? deviceModel;
  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    systemName = 'Android';
    systemVersion =
        '${androidInfo.version.release} (SDK ${androidInfo.version.sdkInt})';
    deviceName = androidInfo.manufacturer;
    deviceModel = androidInfo.model;
  }
  if (Platform.isIOS) {
    var iosInfo = await DeviceInfoPlugin().iosInfo;
    systemName = iosInfo.systemName;
    systemVersion = iosInfo.systemVersion;
    deviceName = iosInfo.name;
    deviceModel = iosInfo.model;
  }

  context.mounted
      ? showDialog(
          context: context,
          builder: (BuildContext context) => _supportInformationPopUp(
            context,
            systemName,
            systemVersion,
            deviceName,
            deviceModel,
          ),
        )
      : null;
}

Widget _supportInformationPopUp(
  BuildContext context,
  String? systemName,
  String? systemVersion,
  String? deviceName,
  String? deviceModel,
) {
  return AlertDialog(
    backgroundColor: AppColors.darkerGrey,
    title: Text(
      'Support Information',
      style: DefaultTextTheme.titilliumWebBold20(context),
      textAlign: TextAlign.center,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'System Name: $systemName',
          style: DefaultTextTheme.titilliumWebRegular16(context),
        ),
        Text(
          'System Version: $systemVersion',
          style: DefaultTextTheme.titilliumWebRegular16(context),
        ),
        Text(
          'Device Model: $deviceModel',
          style: DefaultTextTheme.titilliumWebRegular16(context),
        ),
        Text(
          'Device Name: $deviceName',
          style: DefaultTextTheme.titilliumWebRegular16(context),
        ),
        Text(
          'User Id: ${getIt<CurrentUserAdditionalData>().state!.accountId}',
          style: DefaultTextTheme.titilliumWebRegular16(context),
        ),
      ],
    ),
    actions: <Widget>[
      DefaultButton(
        text: "Copy to clipboard",
        function: () async {
          await Clipboard.setData(
            ClipboardData(
              text:
                  'System Name: $systemName\nSystem Version: $systemVersion\nDevice Model: $deviceModel\nDevice Name: $deviceName\nUser Id: ${getIt<CurrentUserAdditionalData>().state!.accountId}',
            ),
          );
          showSnackBar('Copied to clipboard');
        },
      ),
      DefaultButton(
        text: "Close",
        function: () {
          Navigator.of(context).pop();
        },
        textStyle: DefaultTextTheme.titilliumWebBold16(context)!
            .copyWith(color: AppColors.lighterGrey),
      ),
    ],
  );
}
