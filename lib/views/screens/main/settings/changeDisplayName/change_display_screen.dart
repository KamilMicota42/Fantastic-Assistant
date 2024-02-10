import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/models/user/user_additional_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../services/api/auth/firebase_auth_api.dart';
import '../../../../../services/api/settings/user_data_api.dart';
import '../../../../../settings/injection.dart';
import '../../../../../widgets/background/auth_background_container.dart';
import '../../../../../widgets/buttons/default_button.dart';
import '../../../../../widgets/buttons/go_back_title_row.dart';
import '../../../../../widgets/input/default_text_field_w_label.dart';
import '../../../auth/widgets/text_and_clickable_text_row.dart';
import '../../../inital_loading/cubits/firebase_auth_current_user_uid.dart';

@RoutePage()
class ChangeDisplayNameScreen extends StatefulWidget {
  const ChangeDisplayNameScreen({super.key});

  @override
  State<ChangeDisplayNameScreen> createState() => _ChangeDisplayNameScreenState();
}

class _ChangeDisplayNameScreenState extends State<ChangeDisplayNameScreen> {
  TextEditingController displayNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GoBackTitleRow(
                  screenTitle: 'Change Name',
                ),
                Column(
                  children: [
                    DefaultTextFieldWLabel(
                      textController: displayNameController,
                      labelText: 'Display Name',
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DefaultButton(
                        text: 'Set New Display Name',
                        height: 50,
                        function: () {
                          //AUTH DISPLAY NAME CHANGE
                          FirebaseAuthApi(FirebaseAuth.instance).changeAuthDisplayName(
                            newDisplayName: displayNameController.text,
                          );
                          //FIREBASE DATABASE DISPLAY NAME CHANGE
                          getIt<UserDataApi>().changeUserDisplayName(
                            getIt<CurrentUserAdditionalData>().state!.accountId!,
                            displayNameController.text,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    BlocBuilder<CurrentUserAdditionalData, UserAdditionalData?>(
                      bloc: getIt<CurrentUserAdditionalData>(),
                      builder: (context, state) {
                        return TextAndClickableTextRow(
                          contentText: "Current display name:",
                          clickableContentText: '${state?.accountDisplayName}',
                          function: () {},
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
