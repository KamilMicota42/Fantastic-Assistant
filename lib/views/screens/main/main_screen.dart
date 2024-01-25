import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        GamesRoute(),
        CharactersRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.black,
            fixedColor: AppColors.grey,
            unselectedItemColor: AppColors.white,
            unselectedFontSize: 13,
            selectedFontSize: 16,
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.games_sharp),
                label: 'Games',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp),
                label: 'Characters',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_sharp),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
