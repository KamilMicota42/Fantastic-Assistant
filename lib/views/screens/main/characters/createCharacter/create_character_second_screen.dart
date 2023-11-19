import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/api/characters/characters_api.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/utils/methods/data_validation.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character_id.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../widgets/buttons/go_back_title_row.dart';
import '../logic/show_hint.dart';
import '../widgets/attribute_and_modifier.dart';

@RoutePage()
class CreateCharacterSecondScreen extends StatefulWidget {
  const CreateCharacterSecondScreen({super.key});

  @override
  State<CreateCharacterSecondScreen> createState() =>
      _CreateCharacterSecondScreenState();
}

class _CreateCharacterSecondScreenState
    extends State<CreateCharacterSecondScreen> {
  final TextEditingController _strengthController = TextEditingController();
  final TextEditingController _dexterityController = TextEditingController();
  final TextEditingController _constitutionController = TextEditingController();
  final TextEditingController _intelligenceController = TextEditingController();
  final TextEditingController _wisdomController = TextEditingController();
  final TextEditingController _charismaController = TextEditingController();

  @override
  void initState() {
    _strengthController.text = "10";
    _dexterityController.text = "10";
    _constitutionController.text = "10";
    _intelligenceController.text = "10";
    _wisdomController.text = "10";
    _charismaController.text = "10";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GoBackTitleRow(
                        screenTitle: 'Create Character',
                        popFunction: () {
                          getIt<AppRouter>().navigate(const CharactersRoute());
                        },
                        isX: true,
                        rightSideWidget: InkWell(
                          onTap: () {
                            showHint(
                              context,
                              'Each of a creature’s abilities has a score, a number that defines the magnitude of that ability. An ability score is not just a measure of innate capabilities, but also encompasses a creature’s training and competence in activities related to that ability.\nA score of 10 or 11 is the normal human average, but adventurers and many monsters are a cut above average in most abilities. A score of 18 is the highest that a person usually reaches. Adventurers can have scores as high as 20, and monsters and divine beings can have scores as high as 30.\nEach ability also has a modifier, derived from the score and ranging from −5 (for an ability score of 1) to +10 (for a score of 30). The Ability Scores and Modifiers table notes the ability modifiers for the range of possible ability scores, from 1 to 30.',
                            );
                          },
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Icon(
                                Icons.question_mark_sharp,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: DefaultButton(
                          text: 'Next',
                          height: 50,
                          function: () {
                            if (!isAttributeValid(_strengthController.text) ||
                                !isAttributeValid(_dexterityController.text) ||
                                !isAttributeValid(
                                    _constitutionController.text) ||
                                !isAttributeValid(
                                    _intelligenceController.text) ||
                                !isAttributeValid(_wisdomController.text) ||
                                !isAttributeValid(_charismaController.text)) {
                              showSnackBar(
                                'The values might be incorrect, please check them.',
                              );
                            } else {
                              getIt<CharactersApi>().setCharacterAttributes(
                                getIt<CurrentCharacterId>().state!,
                                int.parse(_strengthController.text),
                                int.parse(_dexterityController.text),
                                int.parse(_constitutionController.text),
                                int.parse(_intelligenceController.text),
                                int.parse(_wisdomController.text),
                                int.parse(_charismaController.text),
                              );
                            }
                          },
                          icon: Icons.arrow_forward_ios_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: AttributeAndModifier(
                                  valueName: "Strength",
                                  valueController: _strengthController,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: AttributeAndModifier(
                                  valueName: "Dexterity",
                                  valueController: _dexterityController,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: AttributeAndModifier(
                                  valueName: "Constitution",
                                  valueController: _constitutionController,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: AttributeAndModifier(
                                  valueName: "Intelligence",
                                  valueController: _intelligenceController,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: AttributeAndModifier(
                                  valueName: "Wisdom",
                                  valueController: _wisdomController,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: AttributeAndModifier(
                                  valueName: "Charisma",
                                  valueController: _charismaController,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
