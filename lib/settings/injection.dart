import 'package:fantastic_assistant/services/api/characters/characters_api.dart';
import 'package:fantastic_assistant/services/api/characters/firebase_storage_api.dart';
import 'package:fantastic_assistant/services/cubits/characters_related_cubits/current_character_id.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String env) async {
  getIt.init(environment: env);
  getIt.registerLazySingleton<CurrentUserAdditionalData>(
      () => CurrentUserAdditionalData());
  getIt.registerLazySingleton<CurrentCharacter>(() => CurrentCharacter());
  getIt.registerLazySingleton<CharactersApi>(() => CharactersApi());
  getIt.registerLazySingleton<FirebaseStorageApi>(() => FirebaseStorageApi());
}
