import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../services/api/auth/firebase_auth_methods.dart';

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
              bottom: 100,
              top: 50,
              left: 25,
              right: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Settings',
                  style: DefaultTextTheme.titilliumWebBold22(context)!
                      .copyWith(color: AppColors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    logUserOut();
                  },
                  child: const Text(
                    'Sign out',
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
