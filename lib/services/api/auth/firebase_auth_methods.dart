import 'package:fantastic_assistant/services/api/settings/firebase_database_user_data.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';
import '../../../utils/methods/show_snack_bar.dart';

// METHODS RELATED TO FIREBASE AUTH FUNCTIONALITY
class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // EMAIL SIGN UP FUNCTION
  Future<void> signUpWithEmail({
    required String email,
    required String displayName,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      context.mounted ? await sendEmailVerification(context, email) : null;
      _auth.currentUser?.updateDisplayName(displayName);
      if (context.mounted) {
        createUserAdditionalData(
          context,
          _auth.currentUser!.uid,
          email,
          displayName,
        );
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message!);
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context, String email) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar('Verification message sent to: $email');
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message!);
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
        getUserAdditionalDataToGetIt(_auth.currentUser!.uid);
        getIt<AppRouter>().replace(const MainRoute());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        showSnackBar('Invalid login credentials');
      } else {
        showSnackBar(e.message!);
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
      showSnackBar('Reset password message sent to: $email');
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message!);
    }
  }

  // LOG OUT FUNCTION
  Future<void> signOut({
    required BuildContext context,
  }) async {
    try {
      getIt<AppRouter>().replace(const LoginOrRegisterRoute());
      await _auth.signOut();
      if (!context.mounted) return;
      getIt<CurrentUserAdditionalData>().remove();
      showSnackBar('Successfully sign out.');
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      showSnackBar(e.message!);
    }
  }

  // CHANGE AUTH DISPLAY NAME
  Future<void> changeAuthDisplayName({
    required String newDisplayName,
  }) async {
    try {
      await _auth.currentUser!.updateDisplayName(newDisplayName);
      debugPrint('Successfully changed the auth.displayName');
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message!);
    }
  }
}
