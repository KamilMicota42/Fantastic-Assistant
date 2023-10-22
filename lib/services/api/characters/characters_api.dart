import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/cubits/characters_related_cubits/current_character_id.dart';
import 'package:flutter/material.dart';

import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';
import '../../../utils/methods/show_snack_bar.dart';
import '../../cubits/user_related_cubits/firebase_auth_current_user_uid.dart';

final CollectionReference _characters =
    FirebaseFirestore.instance.collection('characters');

Future<void> createCharacter(
    BuildContext context, String name, String maxHp, String currHp) async {
  try {
    _characters.add({
      'account_id': getIt<CurrentUserAdditionalData>().state!.accountId,
      'character_name': name,
      'character_max_hp': int.parse(maxHp),
      'character_curr_hp': int.parse(currHp),
    });
    getIt<AppRouter>().navigate(const CharactersRoute());
  } catch (e) {
    debugPrint(e.toString());
    showSnackBar(context, e.toString());
  }
}

Future<void> editCharacter(
    BuildContext context, String name, String maxHp, String currHp) async {
  try {
    _characters.doc(getIt<CurrentCharacter>().state!.characterId).update({
      'character_name': name,
      'character_max_hp': int.parse(maxHp),
      'character_curr_hp': int.parse(currHp),
    });
    getIt<AppRouter>().navigate(const CharactersRoute());
  } catch (e) {
    debugPrint(e.toString());
    showSnackBar(context, e.toString());
  }
}
