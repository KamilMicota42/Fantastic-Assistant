import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../settings/injection.dart';
import '../../../utils/methods/show_snack_bar.dart';
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
      _games.doc(gameId).update({
        'game_path_to_picture': gamePictureUrl,
      });
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(e.toString());
    }
  }
}
