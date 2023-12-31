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
            AutoRoute(page: HomepageRoute.page, initial: true),
            AutoRoute(page: CharactersRoute.page),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
        // settings flow
        AutoRoute(page: ChangeDisplayNameRoute.page),
        // characters flow
        AutoRoute(page: CreateCharacterFirstRoute.page),
        AutoRoute(page: CreateCharacterSecondRoute.page),
        AutoRoute(page: CreateCharacterThirdRoute.page),
        AutoRoute(page: CreateCharacterFourthRoute.page),
        AutoRoute(page: CreateCharacterFifthRoute.page),
        // characters view
        AutoRoute(page: ViewCharacterRoute.page),
      ];
}
