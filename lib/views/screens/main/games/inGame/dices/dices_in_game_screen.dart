import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:flutter/material.dart';

import '../../../../../../settings/injection.dart';
import '../../../../../../settings/routes/app_router.dart';
import '../../../../../../utils/const/app_colors.dart';
import '../../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../../widgets/buttons/go_back_title_row.dart';
import 'widgets/dice_button.dart';

@RoutePage()
class DicesInGameScreen extends StatefulWidget {
  const DicesInGameScreen({super.key});

  @override
  State<DicesInGameScreen> createState() => _DicesInGameScreenState();
}

class _DicesInGameScreenState extends State<DicesInGameScreen> {
  Random random = Random();
  bool isPrivate = false;

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
                  screenTitle: "DICES",
                  isX: true,
                  popFunction: () {
                    getIt<AppRouter>().pop();
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Roll the dice',
                      style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.black),
                    ),
                    Row(
                      children: [
                        Text(
                          'private',
                          style: DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(color: AppColors.black),
                        ),
                        const SizedBox(width: 6),
                        Switch(
                          value: isPrivate,
                          onChanged: (value) {
                            isPrivate = value;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DiceButton(
                      assetPath: 'assets/images/d4.svg',
                      onTap: () {
                        print(random.nextInt(4) + 1);
                      },
                      diceName: 'D4',
                    ),
                    DiceButton(
                      assetPath: 'assets/images/d6.svg',
                      onTap: () {
                        print(random.nextInt(6) + 1);
                      },
                      diceName: 'D6',
                    ),
                    DiceButton(
                      assetPath: 'assets/images/d8.svg',
                      onTap: () {
                        print(random.nextInt(8) + 1);
                      },
                      diceName: 'D8',
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DiceButton(
                      assetPath: 'assets/images/d10.svg',
                      onTap: () {
                        print(random.nextInt(10) + 1);
                      },
                      diceName: 'D10',
                    ),
                    DiceButton(
                      assetPath: 'assets/images/d12.svg',
                      onTap: () {
                        print(random.nextInt(12) + 1);
                      },
                      diceName: 'D12',
                    ),
                    DiceButton(
                      assetPath: 'assets/images/d20.svg',
                      onTap: () {
                        print(random.nextInt(20) + 1);
                      },
                      diceName: 'D20',
                    ),
                  ],
                ),
                AnimatedBuilder(
  animation: mergeTweenables([x,y])
  child: ...
  builder: ...
)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
