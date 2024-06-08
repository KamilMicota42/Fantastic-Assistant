import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/api/games/games_api.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game_id.dart';
import 'package:fantastic_assistant/views/screens/main/games/inGame/dices/widgets/random_number_snackbar.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  List<TypewriterAnimatedText> randoms = [];
  var game = FirebaseFirestore.instance.collection('games').doc(getIt<CurrentGameId>().state).snapshots();
  ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  GoBackTitleRow(
                    screenTitle: "DICES",
                    isX: true,
                    popFunction: () {
                      getIt<AppRouter>().maybePop();
                    },
                  ),
                  SizedBox(
                    height: 26,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Roll the dice',
                          style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.greenWhite),
                        ),
                        Row(
                          children: [
                            Text(
                              isPrivate ? 'private' : 'public',
                              style: DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(color: AppColors.white),
                            ),
                            const SizedBox(width: 6),
                            Switch(
                              value: isPrivate,
                              onChanged: (value) {
                                isPrivate = value;
                                setState(() {});
                              },
                              activeColor: AppColors.greenWhite,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DiceButton(
                        assetPath: 'assets/images/d4.svg',
                        onTap: () async {
                          await rollTheDice(context, 4);
                        },
                        diceName: 'D4',
                      ),
                      DiceButton(
                        assetPath: 'assets/images/d6.svg',
                        onTap: () async {
                          await rollTheDice(context, 6);
                        },
                        diceName: 'D6',
                      ),
                      DiceButton(
                        assetPath: 'assets/images/d8.svg',
                        onTap: () async {
                          await rollTheDice(context, 8);
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
                        onTap: () async {
                          await rollTheDice(context, 10);
                        },
                        diceName: 'D10',
                      ),
                      DiceButton(
                        assetPath: 'assets/images/d12.svg',
                        onTap: () async {
                          await rollTheDice(context, 12);
                        },
                        diceName: 'D12',
                      ),
                      DiceButton(
                        assetPath: 'assets/images/d20.svg',
                        onTap: () async {
                          await rollTheDice(context, 20);
                        },
                        diceName: 'D20',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Roll history',
                        style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.greenWhite),
                      ),
                      SizedBox(
                        height: 24,
                        child: IconButton(
                          onPressed: () {
                            sc.animateTo(sc.position.maxScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.ease);
                          },
                          icon: const Icon(Icons.arrow_drop_up_sharp),
                          padding: EdgeInsets.zero,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          child: SvgPicture.asset(
                            'assets/images/save_throw_background.svg',
                            colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: StreamBuilder<Object>(
                                stream: game,
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return snapshot.data['dice_history'].length > 0
                                        ? ListView.builder(
                                            shrinkWrap: true,
                                            reverse: true,
                                            padding: EdgeInsets.zero,
                                            itemCount: snapshot.data['dice_history'].length,
                                            controller: sc,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "${snapshot.data['dice_history']['$index'][0]}:",
                                                          style: DefaultTextTheme.titilliumWebRegular16(context),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                      Text(
                                                        "${snapshot.data['dice_history']['$index'][2]}: ",
                                                        style: DefaultTextTheme.titilliumWebRegular16(context),
                                                      ),
                                                      Text(
                                                        "${snapshot.data['dice_history']['$index'][1]}",
                                                        style: DefaultTextTheme.titilliumWebBold16(context),
                                                      ),
                                                    ],
                                                  ),
                                                  const Divider()
                                                ],
                                              );
                                            },
                                          )
                                        : Center(
                                            child: Text(
                                              "No rolls yet",
                                              style: DefaultTextTheme.titilliumWebRegular16(context),
                                            ),
                                          );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> rollTheDice(BuildContext context, int dice) async {
    createRandoms(dice);
    showRandomNumberRoll(context, randoms, 'd$dice');
    if (!isPrivate) {
      await Future.delayed(const Duration(seconds: 2));
      await getIt<GamesApi>().addRollToHistoryRoll(
        getIt<CurrentGameId>().state!,
        getIt<CurrentCharacterCubit>().state == null ? 'DM' : getIt<CurrentCharacterCubit>().state!.characterName!,
        'D$dice',
        int.parse(randoms.last.text),
      );
      setState(() {});
    }
  }

  void createRandoms(int dice) {
    randoms = [];
    for (var i = 0; i < 10; i++) {
      randoms.add(
        TypewriterAnimatedText(
          (random.nextInt(dice) + 1).toString(),
          textStyle: DefaultTextTheme.titilliumWebBold22(context)!.copyWith(fontSize: 32),
          speed: Duration(milliseconds: i),
          cursor: '',
        ),
      );
    }
  }
}
