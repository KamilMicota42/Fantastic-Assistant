import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/api/characters/firebase_characters_api.dart';
import 'package:fantastic_assistant/utils/dnd_rules/attribute_to_modifier.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character_id.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:fantastic_assistant/widgets/buttons/go_back_title_row.dart';
import 'package:flutter/material.dart';

import '../../../../../settings/injection.dart';
import '../../../../../settings/routes/app_router.dart';
import '../../../../../settings/routes/app_router.gr.dart';
import '../cubits/current_character.dart';
import '../widgets/left_mid_right_title_row.dart';
import '../widgets/prof_controller_row.dart';

@RoutePage()
class CreateCharacterFourthScreen extends StatefulWidget {
  const CreateCharacterFourthScreen({super.key});

  @override
  State<CreateCharacterFourthScreen> createState() =>
      _CreateCharacterFourthScreenState();
}

class _CreateCharacterFourthScreenState
    extends State<CreateCharacterFourthScreen> {
  bool athleticsProfController = false;
  bool acrobaticsProfController = false;
  bool sleightOfHandsProfController = false;
  bool stealthProfController = false;
  bool arcanaProfController = false;
  bool historyProfController = false;
  bool investigationProfController = false;
  bool natureProfController = false;
  bool religionProfController = false;
  bool animalHandlingProfController = false;
  bool insightProfController = false;
  bool medicineProfController = false;
  bool perceptionProfController = false;
  bool survivalProfController = false;
  bool deceptionProfController = false;
  bool intimidationProfController = false;
  bool performanceProfController = false;
  bool persuasionProfController = false;

  bool saveStrengthProfController = false;
  bool saveDexterityProfController = false;
  bool saveConstitutionProfController = false;
  bool saveIntelligenceProfController = false;
  bool saveWisdomProfController = false;
  bool saveCharismaProfController = false;

  int strengthMod = 0;
  int dexterityMod = 0;
  int constitutionMod = 0;
  int intelligenceMod = 0;
  int wisdomMod = 0;
  int charismaMod = 0;

  int profMod = 2;

  @override
  void initState() {
    strengthMod = attributeToModifier(getIt<CurrentCreateCharacterCubit>()
        .state!
        .characterAttributes!
        .strength!);
    dexterityMod = attributeToModifier(getIt<CurrentCreateCharacterCubit>()
        .state!
        .characterAttributes!
        .dexterity!);
    constitutionMod = attributeToModifier(getIt<CurrentCreateCharacterCubit>()
        .state!
        .characterAttributes!
        .constitution!);
    intelligenceMod = attributeToModifier(getIt<CurrentCreateCharacterCubit>()
        .state!
        .characterAttributes!
        .intelligence!);
    wisdomMod = attributeToModifier(getIt<CurrentCreateCharacterCubit>()
        .state!
        .characterAttributes!
        .wisdom!);
    charismaMod = attributeToModifier(getIt<CurrentCreateCharacterCubit>()
        .state!
        .characterAttributes!
        .charisma!);

    profMod = getIt<CurrentCreateCharacterCubit>()
        .state!
        .characterBasicInfo!
        .proficiency!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
                    const LeftMidRightTitleRow(
                      textLeft: 'Skill',
                      textMid: 'Modifier',
                      textRight: 'Proficiency',
                    ),
                    ProfControllerRow(
                      skillName: 'Athletics',
                      profController: athleticsProfController,
                      skillMod: strengthMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        athleticsProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Acrobatics',
                      profController: acrobaticsProfController,
                      skillMod: dexterityMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        acrobaticsProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Sleight of hands',
                      profController: sleightOfHandsProfController,
                      skillMod: dexterityMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        sleightOfHandsProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Stealth',
                      profController: stealthProfController,
                      skillMod: dexterityMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        stealthProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Arcana',
                      profController: arcanaProfController,
                      skillMod: intelligenceMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        arcanaProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'History',
                      profController: historyProfController,
                      skillMod: intelligenceMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        historyProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Investigation',
                      profController: investigationProfController,
                      skillMod: intelligenceMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        investigationProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Nature',
                      profController: natureProfController,
                      skillMod: intelligenceMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        natureProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Religion',
                      profController: religionProfController,
                      skillMod: intelligenceMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        religionProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Animal handling',
                      profController: animalHandlingProfController,
                      skillMod: wisdomMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        animalHandlingProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Insight',
                      profController: insightProfController,
                      skillMod: wisdomMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        insightProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Medicine',
                      profController: medicineProfController,
                      skillMod: wisdomMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        medicineProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Perception',
                      profController: perceptionProfController,
                      skillMod: wisdomMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        perceptionProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Survival',
                      profController: survivalProfController,
                      skillMod: wisdomMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        survivalProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Deception',
                      profController: deceptionProfController,
                      skillMod: charismaMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        deceptionProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Intimidation',
                      profController: intimidationProfController,
                      skillMod: charismaMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        intimidationProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Performance',
                      profController: performanceProfController,
                      skillMod: charismaMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        performanceProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Persuasion',
                      profController: persuasionProfController,
                      skillMod: charismaMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        persuasionProfController = value;
                        setState(() {});
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: LeftMidRightTitleRow(
                        textLeft: 'Save check',
                        textMid: 'Modifier',
                        textRight: 'Proficiency',
                      ),
                    ),
                    ProfControllerRow(
                      skillName: 'Strength',
                      profController: saveStrengthProfController,
                      skillMod: strengthMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        saveStrengthProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Dexterity',
                      profController: saveDexterityProfController,
                      skillMod: dexterityMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        saveDexterityProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Constitution',
                      profController: saveConstitutionProfController,
                      skillMod: constitutionMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        saveConstitutionProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Intelligence',
                      profController: saveIntelligenceProfController,
                      skillMod: intelligenceMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        saveIntelligenceProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Wisdom',
                      profController: saveWisdomProfController,
                      skillMod: wisdomMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        saveWisdomProfController = value;
                        setState(() {});
                      },
                    ),
                    ProfControllerRow(
                      skillName: 'Charisma',
                      profController: saveCharismaProfController,
                      skillMod: charismaMod,
                      profMod: profMod,
                      handleControllerChange: (value) {
                        saveCharismaProfController = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: DefaultButton(
                        text: 'Next',
                        height: 50,
                        function: () async {
                          getIt<CreateCharactersApi>()
                              .setCharacterSkillsAndSaveChecksProficiency(
                            getIt<CurrentCharacterId>().state!,
                            {
                              'athletics': athleticsProfController,
                              'acrobatics': acrobaticsProfController,
                              'sleight_of_hand': sleightOfHandsProfController,
                              'stealth': stealthProfController,
                              'arcana': arcanaProfController,
                              'history': historyProfController,
                              'investigation': investigationProfController,
                              'nature': natureProfController,
                              'religion': religionProfController,
                              'animal_handling': animalHandlingProfController,
                              'insight': insightProfController,
                              'medicine': medicineProfController,
                              'perception': perceptionProfController,
                              'survival': survivalProfController,
                              'deception': deceptionProfController,
                              'intimidation': intimidationProfController,
                              'performance': performanceProfController,
                              'persuasion': persuasionProfController,
                            },
                            {
                              'save_strength': saveStrengthProfController,
                              'save_dexterity': saveDexterityProfController,
                              'save_constitution':
                                  saveConstitutionProfController,
                              'save_intelligence':
                                  saveIntelligenceProfController,
                              'save_wisdom': saveWisdomProfController,
                              'save_charisma': saveCharismaProfController,
                            },
                          );
                        },
                        icon: Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
