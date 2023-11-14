import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/api/characters/firebase_storage_api.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character_id.dart';
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
    int characterLevel,
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
      getIt<CurrentCharacterId>().set(newCharacterId.id);
      getIt<AppRouter>().navigate(const CreateCharacterSecondRoute());
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

  Future<void> setCharacterAttributes(
    String characterId,
    int strength,
    int dexterity,
    int constitution,
    int intelligence,
    int wisdom,
    int charisma,
  ) async {
    try {
      _characters.doc(characterId).update({
        'character_attributes': {
          'character_strength': strength,
          'character_dexterity': dexterity,
          'character_constitution': constitution,
          'character_intelligence': intelligence,
          'character_wisdom': wisdom,
          'character_charisma': charisma,
        },
      });
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }
}
