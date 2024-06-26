import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/api/users/user_data_api.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:fantastic_assistant/views/screens/main/settings/logic/show_delete_account.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/user/user_additional_data.dart';
import '../../../../services/api/auth/firebase_auth_api.dart';
import '../../../../widgets/buttons/title_row.dart';
import '../../../../widgets/others/default_divider.dart';
import '../../inital_loading/cubits/firebase_auth_current_user_uid.dart';
import 'logic/send_support_email_request.dart';
import 'logic/show_support_information.dart';
import 'widgets/setting_row.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void logUserOut() {
    FirebaseAuthApi(FirebaseAuth.instance).signOut(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              children: [
                const TitleRow(screenTitle: 'SETTINGS'),
                Image.asset(
                  'assets/images/logo_wo_background.png',
                  width: 100,
                  height: 100,
                ),
                BlocBuilder<CurrentUserAdditionalData, UserAdditionalData?>(
                  bloc: getIt<CurrentUserAdditionalData>(),
                  builder: (context, state) {
                    return Text(
                      '${state?.accountDisplayName}',
                      style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.semiWhite),
                    );
                  },
                ),
                Text(
                  '${getIt<CurrentUserAdditionalData>().state?.accountEmail}',
                  style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.semiWhite),
                ),
                const SizedBox(height: 10),
                const DefaultDivider(),
                SettingRow(
                  text: 'Friends',
                  onTap: () async {
                    await getIt<UserDataApi>().getUserAdditionalDataToGetIt(getIt<CurrentUserAdditionalData>().state!.accountId);
                    getIt<AppRouter>().navigate(const FriendsRoute());
                  },
                ),
                const DefaultDivider(),
                SettingRow(
                  text: 'Friends requests',
                  onTap: () async {
                    await getIt<UserDataApi>().getUserAdditionalDataToGetIt(getIt<CurrentUserAdditionalData>().state!.accountId);
                    getIt<AppRouter>().navigate(const FriendsRequestsRoute());
                  },
                ),
                const DefaultDivider(),
                SettingRow(
                  text: 'Change Display Name',
                  onTap: () {
                    getIt<AppRouter>().navigate(const ChangeDisplayNameRoute());
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
                      foregroundColor: WidgetStatePropertyAll(AppColors.lighterGrey),
                      textStyle: WidgetStatePropertyAll(
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
