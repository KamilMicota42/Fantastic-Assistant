import 'package:fantastic_assistant/models/user/user_additional_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fantastic_assistant/utils/methods/shared_pref_methods.dart';

class CurrentUserAdditionalData extends Cubit<UserAdditionalData?> {
  CurrentUserAdditionalData() : super(null);

  void set(UserAdditionalData? newUid) {
    SharedPrefMethods.addStringToSP('user_uid', newUid?.accountId);
    emit(newUid);
  }

  void remove() {
    SharedPrefMethods.removeValueToSP('user_uid');
    emit(null);
  }
}
