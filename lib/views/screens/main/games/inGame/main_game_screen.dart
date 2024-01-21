import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
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
      routes: const [
        SceneInGameRoute(),
        CharacterInGameRoute(),
        DicesInGameRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.white,
            fixedColor: AppColors.iris,
            unselectedItemColor: AppColors.darkerGrey,
            unselectedFontSize: 13,
            selectedFontSize: 16,
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.landscape_sharp),
                label: 'Scene',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp),
                label: 'Character',
              ),
              BottomNavigationBarItem(
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
