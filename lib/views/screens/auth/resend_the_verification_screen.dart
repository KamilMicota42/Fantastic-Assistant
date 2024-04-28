import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/api/auth/firebase_auth_api.dart';
import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';
import '../../../widgets/buttons/default_button.dart';
import '../../../widgets/input/default_text_field_w_label.dart';
import 'widgets/logo_up_column.dart';
import 'widgets/text_and_clickable_text_row.dart';

@RoutePage()
class ResendTheVerificationScreen extends StatefulWidget {
  const ResendTheVerificationScreen({super.key});

  @override
  State<ResendTheVerificationScreen> createState() =>
      _ResendTheVerificationScreenState();
}

class _ResendTheVerificationScreenState
    extends State<ResendTheVerificationScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void resendTheVerificationMessage() async {
    FirebaseAuthApi(FirebaseAuth.instance).sendEmailVerification(
      context,
      emailController.text,
    );
  }

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
                const LogoUpColumn(
                  screenTitle: 'Resend Email',
                ),
                Column(
                  children: [
                    Text(
                      'We have already sent a verification message, if You want a new one, please enter Your email',
                      style: DefaultTextTheme.titilliumWebRegular16(context),
                      textAlign: TextAlign.center,
                    ),
                    DefaultTextFieldWLabel(
                      textController: emailController,
                      labelText: 'Email',
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DefaultButton(
                        text: 'Resend the verification',
                        height: 50,
                        function: resendTheVerificationMessage,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextAndClickableTextRow(
                      contentText: "You remember password?",
                      clickableContentText: 'Log in',
                      function: () {
                        getIt<AppRouter>().navigate(const LoginRoute());
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
