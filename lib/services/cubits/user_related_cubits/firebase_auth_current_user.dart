import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fantastic_assistant/utils/methods/shared_pref_methods.dart';

class FirebaseAuthCurrentUser extends Cubit<User?> {
  FirebaseAuthCurrentUser() : super(null);

  void setNewUser(User? newUser) {
    addStringToSP('user_uid', newUser!.uid);
    emit(newUser);
  }

  void removeCurrUser() {
    removeStringToSP('user_uid');
    emit(null);
  }
}
