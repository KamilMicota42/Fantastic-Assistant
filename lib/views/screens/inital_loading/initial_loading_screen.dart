import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../settings/routes/app_router.dart';

@RoutePage()
class InitialLoadingScreen extends StatefulWidget {
  const InitialLoadingScreen({super.key});

  @override
  State<InitialLoadingScreen> createState() => _InitialLoadingScreen();
}

class _InitialLoadingScreen extends State<InitialLoadingScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userUid = sp.getString('user_uid');

    if (userUid != null) {
      Timer(
        const Duration(seconds: 1),
        () {
          getIt<FirebaseAuthCurrentUserUid>()
              .setNewUserUid(sp.getString('user_uid'));
          getIt<AppRouter>().replace(const MainRoute());
        },
      );
    } else {
      Timer(
        const Duration(seconds: 1),
        () {
          getIt<AppRouter>().replace(const LoginOrRegisterRoute());
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Center(
          child: Stack(
            children: [
              SpinKitSpinningLines(
                color: AppColors.lighterIris,
                size: MediaQuery.of(context).size.width - 50,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
