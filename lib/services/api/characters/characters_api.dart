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
      _characters.doc(characterId).update(
        {
          'character_attributes': {
            'strength': strength,
            'dexterity': dexterity,
            'constitution': constitution,
            'intelligence': intelligence,
            'wisdom': wisdom,
            'charisma': charisma,
          },
        },
      );
      getIt<AppRouter>().navigate(const CreateCharacterThirdRoute());
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }

  Future<void> setCharacterBasicInfo(
    String characterId,
    int proficiency,
    int armorClass,
    int initiative,
    int speed,
    int currentHp,
    int maxHp,
  ) async {
    try {
      _characters.doc(characterId).update(
        {
          'proficiency': proficiency,
          'armorClass': armorClass,
          'initiative': initiative,
          'speed': speed,
          'currentHp': currentHp,
          'maxHp': maxHp,
        },
      );
      getIt<AppRouter>().navigate(const CreateCharacterFourthRoute());
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }

  Future<void> setCharacterSkillsAndSaveChecksProficiency(
    String characterId,
    Map<String, bool> mapOfSkills,
    Map<String, bool> mapOfSaveChecks,
  ) async {
    try {
      _characters.doc(characterId).update(
        {
          'character_prof_skills': mapOfSkills,
          'character_prof_save_checks': mapOfSaveChecks,
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }
}
