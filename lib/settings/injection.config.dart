// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fantastic_assistant/services/api/characters/characters_api.dart'
    as _i6;
import 'package:fantastic_assistant/services/api/firebase_storage_api.dart'
    as _i8;
import 'package:fantastic_assistant/services/api/games/games_api.dart' as _i7;
import 'package:fantastic_assistant/services/api/users/user_data_api.dart'
    as _i5;
import 'package:fantastic_assistant/settings/injectable_modules.dart' as _i13;
import 'package:fantastic_assistant/settings/routes/app_router.dart' as _i3;
import 'package:fantastic_assistant/views/screens/inital_loading/cubits/firebase_auth_current_user_uid.dart'
    as _i4;
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character.dart'
    as _i10;
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character_id.dart'
    as _i9;
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game.dart'
    as _i11;
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game_id.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.AppRouter>(() => injectableModule.router);
    gh.lazySingleton<_i4.CurrentUserAdditionalData>(
        () => injectableModule.currentUserAdditionalData);
    gh.lazySingleton<_i5.UserDataApi>(() => injectableModule.userDataApi);
    gh.lazySingleton<_i6.CharactersApi>(() => injectableModule.charactersApi);
    gh.lazySingleton<_i7.GamesApi>(() => injectableModule.gamesApi);
    gh.lazySingleton<_i8.FirebaseStorageApi>(
        () => injectableModule.firebaseStorageApi);
    gh.lazySingleton<_i9.CurrentCharacterId>(
        () => injectableModule.currentCharacterId);
    gh.lazySingleton<_i10.CurrentCharacterCubit>(
        () => injectableModule.currentCharacterCubit);
    gh.lazySingleton<_i11.CurrentGameCubit>(
        () => injectableModule.currentGameCubit);
    gh.lazySingleton<_i12.CurrentGameId>(() => injectableModule.currentGameId);
    return this;
  }
}

class _$InjectableModule extends _i13.InjectableModule {}
