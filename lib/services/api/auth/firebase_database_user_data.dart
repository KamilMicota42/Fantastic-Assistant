import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/user/user_additional_data.dart';
import '../../../settings/injection.dart';
import '../../../utils/methods/show_snack_bar.dart';
import '../../cubits/user_related_cubits/firebase_auth_current_user_uid.dart';

final CollectionReference _userAdditionalData =
    FirebaseFirestore.instance.collection('userAdditionalData');

Future<void> createUserAdditionalData(
  BuildContext context,
  String userId,
  String email,
  String displayName,
) async {
  try {
    _userAdditionalData.doc(userId).set({
      'account_email': email,
      'account_display_name': displayName,
    });
  } catch (e) {
    debugPrint(e.toString());
    showSnackBar(e.toString());
  }
}

Future<void> getUserAdditionalDataToGetIt(userUid) async {
  var userAdditionalData = await FirebaseFirestore.instance
      .collection('userAdditionalData')
      .doc(userUid)
      .get();

  getIt<CurrentUserAdditionalData>().set(
    UserAdditionalData(
      accountId: userUid,
      accountEmail: userAdditionalData.data()?['account_email'],
      accountDisplayName: userAdditionalData.data()?['account_display_name'],
    ),
  );
}
