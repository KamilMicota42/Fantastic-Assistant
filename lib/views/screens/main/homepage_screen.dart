import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase/firebase_auth_methods.dart';

@RoutePage()
class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  void logUserOut() {
    FirebaseAuthMethods(FirebaseAuth.instance).signOut(
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
              'Homepage screen',
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
    );
  }
}
