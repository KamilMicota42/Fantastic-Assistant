import 'package:fantastic_assistant/services/cubits/firebase_auth_current_user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../settings/injection.dart';
import '../../settings/routes/app_router.dart';
import '../../settings/routes/app_router.gr.dart';
import '../../utils/methods/show_snack_bar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // EMAIL SIGN UP FUNCTION
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      context.mounted ? await sendEmailVerification(context, email) : null;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (!context.mounted) return;
      showSnackBar(context, e.message!);
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context, String email) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Verification message sent to: $email');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      showSnackBar(context, e.message!);
    }
  }

  // EMAIL SIGN UP FUNCTION
  Future<void> loginWEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        getIt<AppRouter>().navigate(const ResendTheVerificationRoute());
      } else if (_auth.currentUser!.emailVerified) {
        getIt<FirebaseAuthCurrentUser>().setNewUser(_auth.currentUser);
        getIt<AppRouter>().navigate(const HomepageRoute());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        debugPrint(e.message);
        if (!context.mounted) return;
        showSnackBar(context, 'Invalid login credentials');
      } else {
        debugPrint(e.message);
        if (!context.mounted) return;
        showSnackBar(context, e.message!);
      }
    }
  }

  // FORGOT PASSWORD FUNCTION
  Future<void> resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
      if (!context.mounted) return;
      showSnackBar(context, 'Reset password message sent to: $email');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      if (!context.mounted) return;
      showSnackBar(context, e.message!);
    }
  }
}
