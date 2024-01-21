import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game.dart';
import 'package:fantastic_assistant/views/screens/main/games/inGame/scene/widgets/scene_picture_in_game.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:flutter/material.dart';

import '../../../../../../settings/injection.dart';
import '../../../../../../settings/routes/app_router.dart';
import '../../../../../../utils/const/app_colors.dart';
import '../../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../../widgets/buttons/go_back_title_row.dart';

@RoutePage()
class SceneInGameScreen extends StatefulWidget {
  const SceneInGameScreen({super.key});

  @override
  State<SceneInGameScreen> createState() => _SceneInGameScreenState();
}

class _SceneInGameScreenState extends State<SceneInGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              children: [
                GoBackTitleRow(
                  screenTitle: "SCENE",
                  isX: true,
                  popFunction: () {
                    getIt<AppRouter>().pop();
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  getIt<CurrentGameCubit>().state?.gameName ?? 'Game title',
                  style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.black),
                ),
                const SizedBox(height: 6),
                ScenePictureInGame(
                  pathToPicture: getIt<CurrentGameCubit>().state?.gamePathToPicture,
                  width: MediaQuery.of(context).size.width - 32,
                  height: MediaQuery.of(context).size.width - 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
