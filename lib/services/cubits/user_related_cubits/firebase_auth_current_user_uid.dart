import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fantastic_assistant/utils/methods/shared_pref_methods.dart';

class FirebaseAuthCurrentUserUid extends Cubit<String?> {
  FirebaseAuthCurrentUserUid() : super(null);

  void setNewUserUid(String? newUid) {
    addStringToSP('user_uid', newUid);
    emit(newUid);
  }

  void removeCurrUserUid() {
    removeStringToSP('user_uid');
    emit(null);
  }
}
