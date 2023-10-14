import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/api/auth/firebase_auth_methods.dart';
import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';
import '../../../widgets/buttons/default_button.dart';
import '../../../widgets/buttons/go_back_icon_button.dart';
import '../../../widgets/input/default_text_field_w_label.dart';
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
    FirebaseAuthMethods(FirebaseAuth.instance).sendEmailVerification(
      context,
      emailController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AuthBackgroundContainer(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 50),
                      const GoBackIconButton(),
                      Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 200,
                      ),
                    ],
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
      ),
    );
  }
}
