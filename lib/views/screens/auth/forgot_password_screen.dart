import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/api/auth/firebase_auth_methods.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:fantastic_assistant/widgets/input/default_text_field_w_label.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';
import 'widgets/logo_up_column.dart';
import 'widgets/text_and_clickable_text_row.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).resetPassword(
      email: emailController.text,
      context: context,
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
                  screenTitle: 'Forgot Password',
                ),
                Column(
                  children: [
                    DefaultTextFieldWLabel(
                      textController: emailController,
                      labelText: 'Email',
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DefaultButton(
                        text: 'Send an email - reset password',
                        height: 50,
                        function: loginUser,
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
                        getIt<AppRouter>().navigate(
                          const LoginRoute(),
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
