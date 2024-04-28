import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';
import '../../../utils/methods/show_snack_bar.dart';
import '../../../views/screens/inital_loading/cubits/firebase_auth_current_user_uid.dart';
import '../users/user_data_api.dart';

// METHODS RELATED TO FIREBASE AUTH FUNCTIONALITY
class FirebaseAuthApi {
  final FirebaseAuth _auth;
  FirebaseAuthApi(this._auth);

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
      await _auth.currentUser?.updateDisplayName(displayName);
      if (context.mounted) {
        getIt<UserDataApi>().createUserAdditionalData(
            context, _auth.currentUser!.uid, email, displayName);
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
        await getIt<UserDataApi>()
            .getUserAdditionalDataToGetIt(_auth.currentUser!.uid);
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
