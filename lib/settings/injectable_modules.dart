import 'package:injectable/injectable.dart';

import '../services/api/characters/characters_api.dart';
import '../services/api/firebase_storage_api.dart';
import '../services/api/games/games_api.dart';
import '../services/api/users/user_data_api.dart';
import '../views/screens/inital_loading/cubits/firebase_auth_current_user_uid.dart';
import '../views/screens/main/characters/cubits/current_character.dart';
import '../views/screens/main/characters/cubits/current_character_id.dart';
import '../views/screens/main/games/cubits/current_game.dart';
import '../views/screens/main/games/cubits/current_game_id.dart';
import 'routes/app_router.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  AppRouter get router => AppRouter();

  @lazySingleton
  CurrentUserAdditionalData get currentUserAdditionalData => CurrentUserAdditionalData();

  @lazySingleton
  UserDataApi get userDataApi => UserDataApi();

  @lazySingleton
  CharactersApi get charactersApi => CharactersApi();

  @lazySingleton
  GamesApi get gamesApi => GamesApi();

  @lazySingleton
  FirebaseStorageApi get firebaseStorageApi => FirebaseStorageApi();

  @lazySingleton
  CurrentCharacterId get currentCharacterId => CurrentCharacterId();

  @lazySingleton
  CurrentCharacterCubit get currentCharacterCubit => CurrentCharacterCubit();

  @lazySingleton
  CurrentGameCubit get currentGameCubit => CurrentGameCubit();

  @lazySingleton
  CurrentGameId get currentGameId => CurrentGameId();
}
