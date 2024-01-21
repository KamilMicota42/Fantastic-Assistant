import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/api/characters/firebase_characters_api.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game_id.dart';
import 'package:flutter/material.dart';

import '../../../models/game_model/game_model.dart';
import '../../../settings/injection.dart';
import '../../../utils/methods/show_snack_bar.dart';
import '../../../views/screens/main/games/cubits/current_game.dart';
import '../../cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import '../firebase_storage_api.dart';

class CreateGamesApi {
  final CollectionReference _games = FirebaseFirestore.instance.collection('games');

  Future<void> createGame(
    //picture
    File? gamePicture,
    //basic info
    String gameName,
    List<String> otherPlayers,
  ) async {
    if (gameName != '') {
      try {
        otherPlayers.add(getIt<CurrentUserAdditionalData>().state!.accountId!);
        DocumentReference newGameId = await _games.add(
          {
            'dm_id': getIt<CurrentUserAdditionalData>().state!.accountId,
            'game_name': gameName,
            'game_path_to_picture': null,
            'players_id': otherPlayers,
            'characters_id': [],
            'dice_history': {},
          },
        );
        if (gamePicture != null) {
          getIt<FirebaseStorageApi>().addGamePicture(
            newGameId.id,
            gamePicture,
          );
        }

        showSnackBar('Successfully created game');
      } catch (e) {
        debugPrint(e.toString());
        showSnackBar(e.toString());
      }
    } else {
      showSnackBar('Game name can not be empty');
    }
  }

  Future<void> setGamePictureUrl(
    String gameId,
    String? gamePictureUrl,
  ) async {
    try {
      await _games.doc(gameId).update(
        {
          'game_path_to_picture': gamePictureUrl,
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }

  Future<void> setGameIntoCubits(
    String gameId,
  ) async {
    try {
      var gameData = await _games.doc(gameId).get();
      getIt<CurrentGameCubit>().set(GameModel.fromJson(jsonEncode(gameData.data()).toString()));
      getIt<CurrentGameId>().set(gameId);
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }

  Future<void> addCharacterToTable(
    String gameId,
    String newCharacterId,
  ) async {
    try {
      var gameDataInJson = await _games.doc(gameId).get();
      var charactersInGame = GameModel.fromJson(jsonEncode(gameDataInJson.data()).toString()).charactersId;
      if (!charactersInGame!.contains(newCharacterId)) {
        charactersInGame.add(newCharacterId);
        await _games.doc(gameId).update(
          {
            'characters_id': charactersInGame,
          },
        );
        await getIt<CreateCharactersApi>().setCharacterIntoCubits(newCharacterId);
      }
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }
}
