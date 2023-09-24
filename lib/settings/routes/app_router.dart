import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: InitialLoadingRoute.page, initial: true),
        AutoRoute(page: LoginOrRegisterRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ResendTheVerificationRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: HomepageRoute.page),
      ];
}
