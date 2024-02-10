import 'dart:io';

import 'package:fantastic_assistant/services/api/characters/characters_api.dart';
import 'package:fantastic_assistant/services/api/games/games_api.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../utils/methods/show_snack_bar.dart';

class FirebaseStorageApi {
  Reference referenceRoot = FirebaseStorage.instance.ref();

  Future<void> addCharacterPicture(
    String characterId,
    File picture,
  ) async {
    Reference referenceDirCharactersPictures = referenceRoot.child('charactersPictures/${characterId}Picture');
    String pictureUrl = '';
    try {
      await referenceDirCharactersPictures.putFile(File(picture.path));
      pictureUrl = await referenceDirCharactersPictures.getDownloadURL();
      getIt<CharactersApi>().setCharacterPictureUrl(
        characterId,
        pictureUrl,
      );
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  Future<void> addGamePicture(
    String gameId,
    File picture,
  ) async {
    Reference referenceDirCharactersPictures = referenceRoot.child('gamesPictures/${gameId}Picture');
    String pictureUrl = '';
    try {
      await referenceDirCharactersPictures.putFile(File(picture.path));
      pictureUrl = await referenceDirCharactersPictures.getDownloadURL();
      getIt<GamesApi>().setGamePictureUrl(
        gameId,
        pictureUrl,
      );
    } catch (e) {
      showSnackBar(e.toString());
    }
  }
}
