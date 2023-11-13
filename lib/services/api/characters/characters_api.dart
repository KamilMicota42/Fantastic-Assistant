import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/api/characters/firebase_storage_api.dart';
import 'package:fantastic_assistant/services/cubits/characters_related_cubits/current_character_id.dart';
import 'package:flutter/material.dart';

import '../../../settings/injection.dart';
import '../../../settings/routes/app_router.dart';
import '../../../settings/routes/app_router.gr.dart';
import '../../../utils/methods/show_snack_bar.dart';
import '../../cubits/user_related_cubits/firebase_auth_current_user_uid.dart';

class CharactersApi {
  final CollectionReference _characters =
      FirebaseFirestore.instance.collection('characters');

  Future<void> createCharacter(
    File? characterPicture,
    String characterName,
    String characterLevel,
    String characterClass,
    String characterRace,
  ) async {
    try {
      DocumentReference newCharacterId = await _characters.add(
        {
          'account_id': getIt<CurrentUserAdditionalData>().state!.accountId,
          'character_path_to_picture': null,
          'character_name': characterName,
          'character_level': characterLevel,
          'character_class': characterClass,
          'character_race': characterRace,
        },
      );
      if (characterPicture != null) {
        getIt<FirebaseStorageApi>().addCharacterPicture(
          newCharacterId.id,
          characterPicture,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }

  Future<void> setCharacterPictureUrl(
    String characterPictureUrl,
    String characterId,
  ) async {
    try {
      _characters.doc(characterId).update({
        'character_path_to_picture': characterPictureUrl,
      });
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }

  Future<void> editCharacter(
    String name,
    String maxHp,
    String currHp,
  ) async {
    try {
      _characters.doc(getIt<CurrentCharacter>().state!.characterId).update({
        'character_name': name,
        'character_max_hp': int.parse(maxHp),
        'character_curr_hp': int.parse(currHp),
      });
      getIt<AppRouter>().navigate(const CharactersRoute());
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }
}
