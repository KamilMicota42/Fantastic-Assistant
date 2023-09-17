import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login screen',
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
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Log in',
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
