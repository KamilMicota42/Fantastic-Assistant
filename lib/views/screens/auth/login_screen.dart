import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/api/auth/firebase_auth_api.dart';
import 'package:fantastic_assistant/views/screens/auth/widgets/text_and_clickable_text_row.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:fantastic_assistant/widgets/input/default_obscure_text_field_w_label.dart';
import 'package:fantastic_assistant/widgets/input/default_text_field_w_label.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';
import 'widgets/logo_up_column.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() {
    FirebaseAuthApi(FirebaseAuth.instance).loginWEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
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
                  screenTitle: 'Login',
                ),
                Column(
                  children: [
                    DefaultTextFieldWLabel(
                      textController: emailController,
                      labelText: 'Email',
                    ),
                    DefaultObscureTextFieldWLabel(
                      textController: passwordController,
                      labelText: 'Password',
                      textObscure: passwordObscure,
                      onPressedFunction: () {
                        passwordObscure = !passwordObscure;
                        setState(() {});
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextAndClickableTextRow(
                          contentText: '',
                          clickableContentText: 'Forgot password',
                          function: () {
                            getIt<AppRouter>().navigate(
                              const ForgotPasswordRoute(),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DefaultButton(
                        text: 'Log in',
                        height: 50,
                        function: loginUser,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextAndClickableTextRow(
                      contentText: "Don't have account?",
                      clickableContentText: 'Register now',
                      function: () {
                        getIt<AppRouter>().navigate(
                          const RegisterRoute(),
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
