// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:fantastic_assistant/views/screens/auth/forgot_password_screen.dart'
    as _i10;
import 'package:fantastic_assistant/views/screens/auth/login_or_register_screen.dart'
    as _i16;
import 'package:fantastic_assistant/views/screens/auth/login_screen.dart'
    as _i17;
import 'package:fantastic_assistant/views/screens/auth/register_screen.dart'
    as _i20;
import 'package:fantastic_assistant/views/screens/auth/resend_the_verification_screen.dart'
    as _i21;
import 'package:fantastic_assistant/views/screens/inital_loading/initial_loading_screen.dart'
    as _i14;
import 'package:fantastic_assistant/views/screens/main/characters/characters_screen.dart'
    as _i3;
import 'package:fantastic_assistant/views/screens/main/characters/editCharacter/edit_character_screen.dart'
    as _i8;
import 'package:fantastic_assistant/views/screens/main/characters/viewCharacter/view_character_screen.dart'
    as _i25;
import 'package:fantastic_assistant/views/screens/main/games/editGame/edit_game_screen.dart'
    as _i9;
import 'package:fantastic_assistant/views/screens/main/games/games_screen.dart'
    as _i13;
import 'package:fantastic_assistant/views/screens/main/games/inGame/character/character_in_game_screen.dart'
    as _i2;
import 'package:fantastic_assistant/views/screens/main/games/inGame/character/dm_characters_in_game_screen.dart'
    as _i5;
import 'package:fantastic_assistant/views/screens/main/games/inGame/character/dm_view_character_in_game_screen.dart'
    as _i7;
import 'package:fantastic_assistant/views/screens/main/games/inGame/dices/dices_in_game_screen.dart'
    as _i4;
import 'package:fantastic_assistant/views/screens/main/games/inGame/main_game_screen.dart'
    as _i18;
import 'package:fantastic_assistant/views/screens/main/games/inGame/scene/dm_edit_scene_in_game_screen.dart'
    as _i6;
import 'package:fantastic_assistant/views/screens/main/games/inGame/scene/scene_in_game_screen.dart'
    as _i22;
import 'package:fantastic_assistant/views/screens/main/games/joinGame/join_game_screen.dart'
    as _i15;
import 'package:fantastic_assistant/views/screens/main/main_screen.dart'
    as _i19;
import 'package:fantastic_assistant/views/screens/main/settings/changeDisplayName/change_display_screen.dart'
    as _i1;
import 'package:fantastic_assistant/views/screens/main/settings/friends/friends_requests_screen.dart'
    as _i11;
import 'package:fantastic_assistant/views/screens/main/settings/friends/friends_screen.dart'
    as _i12;
import 'package:fantastic_assistant/views/screens/main/settings/friends/users_screen.dart'
    as _i24;
import 'package:fantastic_assistant/views/screens/main/settings/settings_screen.dart'
    as _i23;
import 'package:flutter/material.dart' as _i27;

abstract class $AppRouter extends _i26.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    ChangeDisplayNameRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChangeDisplayNameScreen(),
      );
    },
    CharacterInGameRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CharacterInGameScreen(),
      );
    },
    CharactersRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CharactersScreen(),
      );
    },
    DicesInGameRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DicesInGameScreen(),
      );
    },
    DmCharactersRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DmCharactersScreen(),
      );
    },
    DmEditSceneInGameRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DmEditSceneInGameScreen(),
      );
    },
    DmViewCharacterRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DmViewCharacterScreen(),
      );
    },
    EditCharacterRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.EditCharacterScreen(),
      );
    },
    EditGameRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.EditGameScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ForgotPasswordScreen(),
      );
    },
    FriendsRequestsRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.FriendsRequestsScreen(),
      );
    },
    FriendsRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.FriendsScreen(),
      );
    },
    GamesRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.GamesScreen(),
      );
    },
    InitialLoadingRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.InitialLoadingScreen(),
      );
    },
    JoinGameRoute.name: (routeData) {
      final args = routeData.argsAs<JoinGameRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.JoinGameScreen(
          key: args.key,
          isUserDm: args.isUserDm,
        ),
      );
    },
    LoginOrRegisterRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.LoginOrRegisterScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.LoginScreen(),
      );
    },
    MainGameRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.MainGameScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.MainScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.RegisterScreen(),
      );
    },
    ResendTheVerificationRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.ResendTheVerificationScreen(),
      );
    },
    SceneInGameRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SceneInGameScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SettingsScreen(),
      );
    },
    UsersRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.UsersScreen(),
      );
    },
    ViewCharacterRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.ViewCharacterScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChangeDisplayNameScreen]
class ChangeDisplayNameRoute extends _i26.PageRouteInfo<void> {
  const ChangeDisplayNameRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ChangeDisplayNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangeDisplayNameRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CharacterInGameScreen]
class CharacterInGameRoute extends _i26.PageRouteInfo<void> {
  const CharacterInGameRoute({List<_i26.PageRouteInfo>? children})
      : super(
          CharacterInGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterInGameRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CharactersScreen]
class CharactersRoute extends _i26.PageRouteInfo<void> {
  const CharactersRoute({List<_i26.PageRouteInfo>? children})
      : super(
          CharactersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharactersRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DicesInGameScreen]
class DicesInGameRoute extends _i26.PageRouteInfo<void> {
  const DicesInGameRoute({List<_i26.PageRouteInfo>? children})
      : super(
          DicesInGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'DicesInGameRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DmCharactersScreen]
class DmCharactersRoute extends _i26.PageRouteInfo<void> {
  const DmCharactersRoute({List<_i26.PageRouteInfo>? children})
      : super(
          DmCharactersRoute.name,
          initialChildren: children,
        );

  static const String name = 'DmCharactersRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DmEditSceneInGameScreen]
class DmEditSceneInGameRoute extends _i26.PageRouteInfo<void> {
  const DmEditSceneInGameRoute({List<_i26.PageRouteInfo>? children})
      : super(
          DmEditSceneInGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'DmEditSceneInGameRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DmViewCharacterScreen]
class DmViewCharacterRoute extends _i26.PageRouteInfo<void> {
  const DmViewCharacterRoute({List<_i26.PageRouteInfo>? children})
      : super(
          DmViewCharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'DmViewCharacterRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i8.EditCharacterScreen]
class EditCharacterRoute extends _i26.PageRouteInfo<void> {
  const EditCharacterRoute({List<_i26.PageRouteInfo>? children})
      : super(
          EditCharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditCharacterRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i9.EditGameScreen]
class EditGameRoute extends _i26.PageRouteInfo<void> {
  const EditGameRoute({List<_i26.PageRouteInfo>? children})
      : super(
          EditGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditGameRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i26.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i11.FriendsRequestsScreen]
class FriendsRequestsRoute extends _i26.PageRouteInfo<void> {
  const FriendsRequestsRoute({List<_i26.PageRouteInfo>? children})
      : super(
          FriendsRequestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FriendsRequestsRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i12.FriendsScreen]
class FriendsRoute extends _i26.PageRouteInfo<void> {
  const FriendsRoute({List<_i26.PageRouteInfo>? children})
      : super(
          FriendsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FriendsRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i13.GamesScreen]
class GamesRoute extends _i26.PageRouteInfo<void> {
  const GamesRoute({List<_i26.PageRouteInfo>? children})
      : super(
          GamesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GamesRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i14.InitialLoadingScreen]
class InitialLoadingRoute extends _i26.PageRouteInfo<void> {
  const InitialLoadingRoute({List<_i26.PageRouteInfo>? children})
      : super(
          InitialLoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLoadingRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i15.JoinGameScreen]
class JoinGameRoute extends _i26.PageRouteInfo<JoinGameRouteArgs> {
  JoinGameRoute({
    _i27.Key? key,
    required bool isUserDm,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          JoinGameRoute.name,
          args: JoinGameRouteArgs(
            key: key,
            isUserDm: isUserDm,
          ),
          initialChildren: children,
        );

  static const String name = 'JoinGameRoute';

  static const _i26.PageInfo<JoinGameRouteArgs> page =
      _i26.PageInfo<JoinGameRouteArgs>(name);
}

class JoinGameRouteArgs {
  const JoinGameRouteArgs({
    this.key,
    required this.isUserDm,
  });

  final _i27.Key? key;

  final bool isUserDm;

  @override
  String toString() {
    return 'JoinGameRouteArgs{key: $key, isUserDm: $isUserDm}';
  }
}

/// generated route for
/// [_i16.LoginOrRegisterScreen]
class LoginOrRegisterRoute extends _i26.PageRouteInfo<void> {
  const LoginOrRegisterRoute({List<_i26.PageRouteInfo>? children})
      : super(
          LoginOrRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginOrRegisterRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i17.LoginScreen]
class LoginRoute extends _i26.PageRouteInfo<void> {
  const LoginRoute({List<_i26.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i18.MainGameScreen]
class MainGameRoute extends _i26.PageRouteInfo<void> {
  const MainGameRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MainGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainGameRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i19.MainScreen]
class MainRoute extends _i26.PageRouteInfo<void> {
  const MainRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RegisterScreen]
class RegisterRoute extends _i26.PageRouteInfo<void> {
  const RegisterRoute({List<_i26.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ResendTheVerificationScreen]
class ResendTheVerificationRoute extends _i26.PageRouteInfo<void> {
  const ResendTheVerificationRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ResendTheVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResendTheVerificationRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SceneInGameScreen]
class SceneInGameRoute extends _i26.PageRouteInfo<void> {
  const SceneInGameRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SceneInGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'SceneInGameRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SettingsScreen]
class SettingsRoute extends _i26.PageRouteInfo<void> {
  const SettingsRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i24.UsersScreen]
class UsersRoute extends _i26.PageRouteInfo<void> {
  const UsersRoute({List<_i26.PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ViewCharacterScreen]
class ViewCharacterRoute extends _i26.PageRouteInfo<void> {
  const ViewCharacterRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ViewCharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewCharacterRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}
