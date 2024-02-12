import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/models/characters/character_model/character_model.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character.dart';
import 'package:flutter/material.dart';

import '../../../settings/injection.dart';
import '../../../utils/methods/show_snack_bar.dart';
import '../../../views/screens/inital_loading/cubits/firebase_auth_current_user_uid.dart';
import '../../../views/screens/main/characters/cubits/current_character_id.dart';
import '../firebase_storage_api.dart';

class CharactersApi {
  final CollectionReference _characters = FirebaseFirestore.instance.collection('characters');

  Future<void> createCharacter(
    //picture
    File? characterPicture,
    bool pictureChanged,
    //basic info
    String characterName,
    int characterLevel,
    String characterClass,
    String characterRace,
    Map<String, int> mapOfBasicInfo,
    //attributes
    Map<String, int> mapOfAttributes,
    //saving throws
    Map<String, bool> mapOfSaveChecks,
    //skills
    Map<String, bool> mapOfSkills,
    //notes
    List<dynamic> listOfNotes,
  ) async {
    if (characterName != '') {
      try {
        DocumentReference newCharacterId = await _characters.add(
          {
            'account_id': getIt<CurrentUserAdditionalData>().state!.accountId,
            'character_path_to_picture': null,
            'character_name': characterName,
            'character_level': characterLevel,
            'character_class': characterClass,
            'character_race': characterRace,
            'character_basic_info': mapOfBasicInfo,
            'character_attributes': mapOfAttributes,
            'character_prof_skills': mapOfSkills,
            'character_prof_save_checks': mapOfSaveChecks,
            'character_notes': listOfNotes,
          },
        );
        if (characterPicture != null && pictureChanged) {
          getIt<FirebaseStorageApi>().addCharacterPicture(
            newCharacterId.id,
            characterPicture,
          );
        }
        if (characterPicture == null && pictureChanged) {
          setCharacterPictureUrl(
            newCharacterId.id,
            null,
          );
        }
        await setCharacterIntoCubits(newCharacterId.id);
        showSnackBar('Successfully added character');
        getIt<AppRouter>().pop();
      } catch (e) {
        debugPrint(e.toString());
        showSnackBar(e.toString());
      }
    } else {
      showSnackBar('Characters name can not be empty');
    }
  }

  Future<void> updateCharacter(
    //character id
    String characterId,
    //picture
    File? characterPicture,
    bool pictureChanged,
    //basic info
    String characterName,
    int characterLevel,
    String characterClass,
    String characterRace,
    Map<String, int> mapOfBasicInfo,
    //attributes
    Map<String, int> mapOfAttributes,
    //saving throws
    Map<String, bool> mapOfSaveChecks,
    //skills
    Map<String, bool> mapOfSkills,
    //notes
    List<dynamic> listOfNotes,
  ) async {
    if (characterName != '') {
      try {
        await _characters.doc(characterId).update(
          {
            'account_id': getIt<CurrentUserAdditionalData>().state!.accountId,
            'character_name': characterName,
            'character_level': characterLevel,
            'character_class': characterClass,
            'character_race': characterRace,
            "character_basic_info": mapOfBasicInfo,
            'character_attributes': mapOfAttributes,
            'character_prof_skills': mapOfSkills,
            'character_prof_save_checks': mapOfSaveChecks,
            'character_notes': listOfNotes,
          },
        );
        if (characterPicture != null && pictureChanged) {
          await getIt<FirebaseStorageApi>().addCharacterPicture(
            characterId,
            characterPicture,
          );
        }
        if (characterPicture == null && pictureChanged) {
          await setCharacterPictureUrl(
            characterId,
            null,
          );
        }
        await setCharacterIntoCubits(characterId);
        showSnackBar('Successfully updated character');
      } catch (e) {
        debugPrint(e.toString());
        showSnackBar(e.toString());
      }
    } else {
      showSnackBar('Character name can not be empty');
    }
  }

  Future<void> setCharacterPictureUrl(
    String characterId,
    String? characterPictureUrl,
  ) async {
    try {
      await _characters.doc(characterId).update({
        'character_path_to_picture': characterPictureUrl,
      });
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }

  Future<void> setCharacterIntoCubits(
    String characterId,
  ) async {
    try {
      var characterData = await _characters.doc(characterId).get();
      getIt<CurrentCharacterCubit>().set(CharacterModel.fromJson(jsonEncode(characterData.data()).toString()));
      getIt<CurrentCharacterId>().set(characterId);
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }
}
