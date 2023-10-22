import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/methods/show_snack_bar.dart';

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
      'account_id': userId,
      'account_email': email,
      'account_display_name': displayName,
    });
  } catch (e) {
    debugPrint(e.toString());
    showSnackBar(context, e.toString());
  }
}
