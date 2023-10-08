import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/api/auth/firebase_auth_methods.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register screen',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: repeatPasswordController,
                decoration: const InputDecoration(hintText: 'Repeat password'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (passwordController.text == repeatPasswordController.text) {
                  signUpUser();
                } else {
                  showSnackBar(context, 'Passwords do not match');
                }
              },
              child: const Text(
                'Register',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                getIt<AppRouter>().navigate(const LoginOrRegisterRoute());
              },
              child: const Text(
                'go to login or rergister',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
