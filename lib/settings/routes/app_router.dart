import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // auth flow
        AutoRoute(page: InitialLoadingRoute.page, initial: true),
        AutoRoute(page: LoginOrRegisterRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ResendTheVerificationRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        // main flow
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(page: GamesRoute.page, initial: true),
            AutoRoute(page: CharactersRoute.page),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
        // settings flow
        AutoRoute(page: ChangeDisplayNameRoute.page),
        AutoRoute(page: UsersRoute.page),
        AutoRoute(page: FriendsRequestsRoute.page),
        AutoRoute(page: FriendsRoute.page),
        // characters flow
        AutoRoute(page: ViewCharacterRoute.page),
        AutoRoute(page: EditCharacterRoute.page),
        // games flow
        AutoRoute(page: EditGameRoute.page),
        AutoRoute(page: JoinGameRoute.page),
        // in game flow
        AutoRoute(
          page: MainGameRoute.page,
          children: [
            // scene
            AutoRoute(page: SceneInGameRoute.page),
            // characters
            AutoRoute(page: CharacterInGameRoute.page),
            AutoRoute(page: DmCharactersRoute.page),
            // dices
            AutoRoute(page: DicesInGameRoute.page),
          ],
        ),
        // edit game
        AutoRoute(page: DmEditSceneInGameRoute.page),
      ];
}
