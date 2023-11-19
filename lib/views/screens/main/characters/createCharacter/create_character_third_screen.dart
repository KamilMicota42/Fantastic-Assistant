import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/utils/methods/data_validation.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/value_field.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:fantastic_assistant/widgets/buttons/go_back_title_row.dart';
import 'package:flutter/material.dart';

import '../../../../../services/api/characters/characters_api.dart';
import '../../../../../settings/injection.dart';
import '../../../../../settings/routes/app_router.dart';
import '../../../../../settings/routes/app_router.gr.dart';
import '../../../../../utils/methods/show_snack_bar.dart';
import '../cubits/current_character_id.dart';
import '../widgets/curr_hp_max_hp_text_field.dart';

@RoutePage()
class CreateCharacterThirdScreen extends StatefulWidget {
  const CreateCharacterThirdScreen({super.key});

  @override
  State<CreateCharacterThirdScreen> createState() =>
      _CreateCharacterThirdScreenState();
}

class _CreateCharacterThirdScreenState
    extends State<CreateCharacterThirdScreen> {
  final TextEditingController _proficiencyController = TextEditingController();
  final TextEditingController _armorClassController = TextEditingController();
  final TextEditingController _initiativeClassController =
      TextEditingController();
  final TextEditingController _speedController = TextEditingController();
  final TextEditingController _currentHpController = TextEditingController();
  final TextEditingController _maxHpController = TextEditingController();

  @override
  void initState() {
    _proficiencyController.text = '2';
    _armorClassController.text = '10';
    _initiativeClassController.text = '0';
    _speedController.text = '30';
    _currentHpController.text = '0';
    _maxHpController.text = '0';
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: DefaultButton(
                          text: 'Next',
                          height: 50,
                          function: () async {
                            if (!isIntable(_proficiencyController.text) ||
                                !isIntable(_armorClassController.text) ||
                                !isIntable(_initiativeClassController.text) ||
                                !isIntable(_speedController.text) ||
                                !isIntable(_currentHpController.text) ||
                                !isIntable(_maxHpController.text)) {
                              showSnackBar(
                                'The values might be incorrect, please check them.',
                              );
                            } else {
                              getIt<CharactersApi>().setCharacterBasicInfo(
                                getIt<CurrentCharacterId>().state!,
                                int.parse(_proficiencyController.text),
                                int.parse(_armorClassController.text),
                                int.parse(_initiativeClassController.text),
                                int.parse(_speedController.text),
                                int.parse(_currentHpController.text),
                                int.parse(_maxHpController.text),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 120),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  child: ValueField(
                                    valueName: "Proficiency",
                                    valueController: _proficiencyController,
                                    hintText:
                                        "Unique to 5th edition, instead of putting points into individual skills you have a general purpose \"proficiency bonus\" that's based on your level and is applied to attack rolls, saving throws, and skill checks if you're proficient in that task. Under You will find list of how many proficiency points on each level:\nLevel 1 - 2\nLevel 2 - 2\nLevel 3 - 2\nLevel 4 - 2\nLevel 5 - 3\nLevel 6 - 3\nLevel 7 - 3\nLevel 8 - 3\nLevel 9 - 4\nLevel 10 - 4\nLevel 11 - 4\nLevel 12 - 4\nLevel 13 - 5\nLevel 14 - 5\nLevel 15 - 5\nLevel 16 - 5\nLevel 17 - 6\nLevel 18 - 6\nLevel 19 - 6\nLevel 20 - 6\n",
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  child: ValueField(
                                    valueName: "Armor Class",
                                    valueController: _armorClassController,
                                    hintText:
                                        "When unarmored, your base Armor Class is 10 + Dexterity modifier. If you have a spell, item, feat, or racial trait that affects your Armor Class then the calculation will change. The two most common ways to increase AC are to pump your Dexterity modifier (if you’re not wearing heavy armor) or to equip better armor.",
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
                                  child: ValueField(
                                    valueName: "Initiative",
                                    valueController: _initiativeClassController,
                                    hintText:
                                        "Initiative is a crucial aspect of combat in Dungeons & Dragons as it determines the order in which each creature takes their turn. When calculating initiative, there are a few things to note. Each creature has an Initiative Bonus, which is equal to their Dexterity Modifier, plus any bonuses they have from feats, classes, and such, which will state the bonuses they grant. When initiative is called, each creature acts from highest initiative to lowest.",
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  child: ValueField(
                                    valueName: "Speed",
                                    valueController: _speedController,
                                    hintText:
                                        "Every character and monster has a speed, which is the distance in feet that the character or monster can walk in 1 round. This number assumes short bursts of energetic movement in the midst of a life- threatening situation.",
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
                                  child: CurrHpMaxHpTextField(
                                    currentHpController: _currentHpController,
                                    maxHpController: _maxHpController,
                                    hintText:
                                        "Your character’s hit points define how tough your character is in combat and other dangerous situations. Your hit points are determined by your Hit Dice (short for Hit Point Dice).\nAt 1st level, your character has 1 Hit Die, and the die type is determined by your class. You start with hit points equal to the highest roll of that die, as indicated in your class description. (You also add your Constitution modifier, which you’ll determine in step 3.) This is also your hit point maximum",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
