import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/api/auth/firebase_auth_methods.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:fantastic_assistant/widgets/input/default_text_field_w_label.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';
import '../../../widgets/input/default_obscure_text_field_w_label.dart';
import 'widgets/logo_up_column.dart';
import 'widgets/text_and_clickable_text_row.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  bool passwordObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    displayNameController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    bool isDataValid = true;
    if (passwordController.text != repeatPasswordController.text) {
      isDataValid = false;
      showSnackBar('Passwords do not match');
    }
    if (displayNameController.text == '') {
      isDataValid = false;
      showSnackBar('Display name can not be empty');
    }
    isDataValid
        ? FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
            email: emailController.text,
            displayName: displayNameController.text,
            password: passwordController.text,
            context: context,
          )
        : null;
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
                const LogoUpColumn(),
                Column(
                  children: [
                    DefaultTextFieldWLabel(
                      textController: emailController,
                      labelText: 'Email',
                    ),
                    DefaultTextFieldWLabel(
                      textController: displayNameController,
                      labelText: 'Username',
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
                    DefaultObscureTextFieldWLabel(
                      textController: repeatPasswordController,
                      labelText: 'Repeat password',
                      textObscure: passwordObscure,
                      onPressedFunction: () {
                        passwordObscure = !passwordObscure;
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DefaultButton(
                        text: 'Register',
                        height: 50,
                        function: () {
                          signUpUser();
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextAndClickableTextRow(
                      contentText: 'Have an account?',
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
