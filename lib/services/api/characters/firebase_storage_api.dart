import 'dart:io';

import 'package:fantastic_assistant/services/api/characters/firebase_characters_api.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../utils/methods/show_snack_bar.dart';

class FirebaseStorageApi {
  Reference referenceRoot = FirebaseStorage.instance.ref();

  Future<void> addCharacterPicture(
    String characterId,
    File picture,
  ) async {
    Reference referenceDirCharactersPictures =
        referenceRoot.child('charactersPictures/${characterId}Picture');
    String pictureUrl = '';
    try {
      await referenceDirCharactersPictures.putFile(File(picture.path));
      pictureUrl = await referenceDirCharactersPictures.getDownloadURL();
      getIt<CreateCharactersApi>().setCharacterPictureUrl(
        pictureUrl,
        characterId,
      );
    } catch (e) {
      showSnackBar(e.toString());
    }
  }
}
