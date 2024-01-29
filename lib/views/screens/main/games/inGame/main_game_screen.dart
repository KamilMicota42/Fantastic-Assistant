import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainGameScreen extends StatefulWidget {
  const MainGameScreen({super.key});

  @override
  State<MainGameScreen> createState() => _MainGameScreenState();
}

class _MainGameScreenState extends State<MainGameScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        const SceneInGameRoute(),
        getIt<CurrentUserAdditionalData>().state?.accountId == getIt<CurrentGameCubit>().state?.dmId
            ? const DmCharactersRoute()
            : const CharacterInGameRoute(),
        const DicesInGameRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.black,
            fixedColor: AppColors.greenWhite,
            unselectedItemColor: AppColors.white,
            unselectedFontSize: 13,
            selectedFontSize: 16,
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.landscape_sharp),
                label: 'Scene',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle_sharp),
                label: getIt<CurrentUserAdditionalData>().state?.accountId == getIt<CurrentGameCubit>().state?.dmId ? 'Characters' : 'Character',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.casino_sharp),
                label: 'Dices',
              ),
            ],
          ),
        );
      },
    );
  }
}
