import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseAuthCurrentUser extends Cubit<User?> {
  FirebaseAuthCurrentUser() : super(null);

  void setNewUser(User? newUser) {
    emit(newUser);
  }

  void removeCurrUser() {
    emit(null);
  }
}
