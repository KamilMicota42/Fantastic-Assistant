import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/utils/dnd_rules/dnd_hints.dart';
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
                                    hintText: dndHints['proficiency'],
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
                                    hintText: dndHints['armorClass'],
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
                                    hintText: dndHints['initiative'],
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
                                    hintText: dndHints['speed'],
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
                                    hintText: dndHints['hp'],
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
