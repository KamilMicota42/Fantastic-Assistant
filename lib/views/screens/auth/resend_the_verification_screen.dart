import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/api/auth/firebase_auth_methods.dart';
import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';

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
    FirebaseAuthMethods(FirebaseAuth.instance)
        .sendEmailVerification(context, emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Resend the email verification',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            ElevatedButton(
              onPressed: resendTheVerificationMessage,
              child: const Text(
                'Resend the verification',
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
