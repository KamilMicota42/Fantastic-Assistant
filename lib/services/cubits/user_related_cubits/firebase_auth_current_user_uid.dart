import 'package:fantastic_assistant/models/user/user_additional_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fantastic_assistant/utils/methods/shared_pref_methods.dart';

class FirebaseAuthCurrentUserUid extends Cubit<String?> {
  FirebaseAuthCurrentUserUid() : super(null);

  void setNewUserUid(String? newUid) {
    addStringToSP('user_uid', newUid);
    emit(newUid);
  }

  void removeCurrUserUid() {
    removeValueToSP('user_uid');
    emit(null);
  }
}

class CurrentUserAdditionalData extends Cubit<UserAdditionalData?> {
  CurrentUserAdditionalData() : super(null);

  void set(UserAdditionalData? newUid) {
    addStringToSP('user_uid', newUid?.accountId);
    emit(newUid);
  }

  void remove() {
    removeValueToSP('user_uid');
    emit(null);
  }
}
