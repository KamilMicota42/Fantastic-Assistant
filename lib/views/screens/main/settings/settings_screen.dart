import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:fantastic_assistant/views/screens/main/settings/logic/show_change_name.dart';
import 'package:fantastic_assistant/views/screens/main/settings/logic/show_delete_account.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/user/user_additional_data.dart';
import '../../../../services/api/auth/firebase_auth_methods.dart';
import 'logic/send_support_email_request.dart';
import 'logic/show_support_information.dart';
import '../../../../widgets/others/default_divider.dart';
import 'widgets/setting_row.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void logUserOut() {
    FirebaseAuthMethods(FirebaseAuth.instance).signOut(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Settings',
                    style: DefaultTextTheme.titilliumWebBold22(context)!
                        .copyWith(color: AppColors.black),
                  ),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
                BlocBuilder<CurrentUserAdditionalData, UserAdditionalData?>(
                  bloc: getIt<CurrentUserAdditionalData>(),
                  builder: (context, state) {
                    return Text(
                      '${state?.accountDisplayName}',
                      style: DefaultTextTheme.titilliumWebBold20(context)!
                          .copyWith(color: AppColors.darkerGrey),
                    );
                  },
                ),
                BlocBuilder<CurrentUserAdditionalData, UserAdditionalData?>(
                  bloc: getIt<CurrentUserAdditionalData>(),
                  builder: (context, state) {
                    return Text(
                      '${state?.accountEmail}',
                      style: DefaultTextTheme.titilliumWebBold20(context)!
                          .copyWith(color: AppColors.darkerGrey),
                    );
                  },
                ),
                const SizedBox(height: 10),
                const DefaultDivider(),
                SettingRow(
                  text: 'Change Display Name',
                  onTap: () {
                    showChangeName(context);
                  },
                ),
                const DefaultDivider(),
                SettingRow(
                  text: 'Support',
                  onTap: () {
                    sendSupportEmailRequest();
                  },
                ),
                const DefaultDivider(),
                SettingRow(
                  text: 'Support Information',
                  onTap: () {
                    showSupportInformation(context);
                  },
                ),
                const DefaultDivider(),
                SettingRow(
                  text: 'Privacy Policy',
                  onTap: () {},
                ),
                const DefaultDivider(),
                SettingRow(
                  text: 'Terms of Use',
                  onTap: () {},
                ),
                const DefaultDivider(),
                const SizedBox(height: 50),
                DefaultButton(
                  text: 'Sign Out',
                  function: () {
                    logUserOut();
                  },
                  height: 50,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(
                        AppColors.red,
                      ),
                      textStyle: MaterialStatePropertyAll(
                        TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    onPressed: () {
                      showDeleteAccount(context);
                    },
                    child: const Text('Delete Account'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
