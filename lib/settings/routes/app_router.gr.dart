// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:fantastic_assistant/views/screens/auth/forgot_password_screen.dart'
    as _i4;
import 'package:fantastic_assistant/views/screens/auth/login_or_register_screen.dart'
    as _i7;
import 'package:fantastic_assistant/views/screens/auth/login_screen.dart'
    as _i8;
import 'package:fantastic_assistant/views/screens/auth/register_screen.dart'
    as _i10;
import 'package:fantastic_assistant/views/screens/auth/resend_the_verification_screen.dart'
    as _i11;
import 'package:fantastic_assistant/views/screens/inital_loading/initial_loading_screen.dart'
    as _i6;
import 'package:fantastic_assistant/views/screens/main/characters/characters_screen.dart'
    as _i2;
import 'package:fantastic_assistant/views/screens/main/characters/editCharacter/edit_character_screen.dart'
    as _i3;
import 'package:fantastic_assistant/views/screens/main/characters/viewCharacter/view_character_screen.dart'
    as _i13;
import 'package:fantastic_assistant/views/screens/main/homepage/homepage_screen.dart'
    as _i5;
import 'package:fantastic_assistant/views/screens/main/main_screen.dart' as _i9;
import 'package:fantastic_assistant/views/screens/main/settings/change_display_screen.dart'
    as _i1;
import 'package:fantastic_assistant/views/screens/main/settings/settings_screen.dart'
    as _i12;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    ChangeDisplayNameRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChangeDisplayNameScreen(),
      );
    },
    CharactersRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CharactersScreen(),
      );
    },
    EditCharacterRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EditCharacterScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordScreen(),
      );
    },
    HomepageRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomepageScreen(),
      );
    },
    InitialLoadingRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.InitialLoadingScreen(),
      );
    },
    LoginOrRegisterRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginOrRegisterScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MainScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.RegisterScreen(),
      );
    },
    ResendTheVerificationRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ResendTheVerificationScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SettingsScreen(),
      );
    },
    ViewCharacterRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ViewCharacterScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChangeDisplayNameScreen]
class ChangeDisplayNameRoute extends _i14.PageRouteInfo<void> {
  const ChangeDisplayNameRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ChangeDisplayNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangeDisplayNameRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CharactersScreen]
class CharactersRoute extends _i14.PageRouteInfo<void> {
  const CharactersRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CharactersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharactersRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditCharacterScreen]
class EditCharacterRoute extends _i14.PageRouteInfo<void> {
  const EditCharacterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          EditCharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditCharacterRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i14.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomepageScreen]
class HomepageRoute extends _i14.PageRouteInfo<void> {
  const HomepageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomepageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomepageRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.InitialLoadingScreen]
class InitialLoadingRoute extends _i14.PageRouteInfo<void> {
  const InitialLoadingRoute({List<_i14.PageRouteInfo>? children})
      : super(
          InitialLoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialLoadingRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginOrRegisterScreen]
class LoginOrRegisterRoute extends _i14.PageRouteInfo<void> {
  const LoginOrRegisterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginOrRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginOrRegisterRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginScreen]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MainScreen]
class MainRoute extends _i14.PageRouteInfo<void> {
  const MainRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RegisterScreen]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ResendTheVerificationScreen]
class ResendTheVerificationRoute extends _i14.PageRouteInfo<void> {
  const ResendTheVerificationRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ResendTheVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResendTheVerificationRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SettingsScreen]
class SettingsRoute extends _i14.PageRouteInfo<void> {
  const SettingsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ViewCharacterScreen]
class ViewCharacterRoute extends _i14.PageRouteInfo<void> {
  const ViewCharacterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ViewCharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewCharacterRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
