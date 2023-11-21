import 'package:fantastic_assistant/services/api/characters/firebase_characters_api.dart';
import 'package:fantastic_assistant/services/api/characters/firebase_storage_api.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character_id.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String env) async {
  getIt.init(environment: env);
  getIt.registerLazySingleton<CurrentUserAdditionalData>(
      () => CurrentUserAdditionalData());
  getIt.registerLazySingleton<CreateCharactersApi>(() => CreateCharactersApi());
  getIt.registerLazySingleton<FirebaseStorageApi>(() => FirebaseStorageApi());
  getIt.registerLazySingleton<CurrentCharacterId>(() => CurrentCharacterId());
  getIt.registerLazySingleton<CurrentCreateCharacterCubit>(
      () => CurrentCreateCharacterCubit());
}
