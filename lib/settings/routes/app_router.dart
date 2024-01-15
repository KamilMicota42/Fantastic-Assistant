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
        AutoRoute(page: UsersRoute.page),
        AutoRoute(page: FriendsRequestsRoute.page),
        AutoRoute(page: FriendsRoute.page),
        // characters view
        AutoRoute(page: ViewCharacterRoute.page),
        AutoRoute(page: EditCharacterRoute.page),
      ];
}
