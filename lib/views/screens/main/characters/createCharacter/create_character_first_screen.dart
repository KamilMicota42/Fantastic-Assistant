import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/api/characters/characters_api.dart';
import 'package:fantastic_assistant/utils/const/enums/character_class_list.dart';
import 'package:fantastic_assistant/utils/const/enums/character_races_list.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/custom_dropdown_menu.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:fantastic_assistant/widgets/buttons/go_back_title_row.dart';
import 'package:fantastic_assistant/widgets/input/default_text_field_w_label.dart';
import 'package:flutter/material.dart';

import '../../../../../settings/injection.dart';
import '../../../../../settings/routes/app_router.dart';
import '../../../../../settings/routes/app_router.gr.dart';
import '../../../../../utils/const/enums/character_levels_list.dart';
import '../../../../../widgets/buttons/add_photo_icon_button.dart';
import '../../../../../widgets/texts/describer_of_textfield.dart';

@RoutePage()
class CreateCharacterFirstScreen extends StatefulWidget {
  const CreateCharacterFirstScreen({super.key});

  @override
  State<CreateCharacterFirstScreen> createState() =>
      _CreateCharacterFirstScreenState();
}

class _CreateCharacterFirstScreenState
    extends State<CreateCharacterFirstScreen> {
  final TextEditingController _characterNameController =
      TextEditingController();

  String _levelValue = characterLevelsList.first;
  String _classValue = characterClassesList.first;
  String _raceValue = characterRacesList.first;
  File? _pictureValue;

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
                            if (_characterNameController.text.isEmpty) {
                              showSnackBar('Character name can not be empty');
                            } else {
                              int? levelIntValue =
                                  levelReturnIntFromString(_levelValue);
                              await getIt<CharactersApi>().createCharacter(
                                _pictureValue,
                                _characterNameController.text,
                                levelIntValue,
                                _classValue,
                                _raceValue,
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
                          AddPhotoIconButton(
                            onTapFunction: (var value) {
                              _pictureValue = value;
                            },
                          ),
                          DefaultTextFieldWLabel(
                            textController: _characterNameController,
                            labelText: 'Character name',
                          ),
                          const SizedBox(height: 20),
                          const DescriberOfTextField(
                            title: 'Level',
                            icon: Icons.arrow_upward_sharp,
                          ),
                          CustomDropdownMenu(
                            listItem: characterLevelsList,
                            onChanged: (value) {
                              _levelValue = value;
                            },
                            initialValue: characterLevelsList.first,
                          ),
                          const SizedBox(height: 20),
                          const DescriberOfTextField(
                            title: 'Class',
                            icon: Icons.boy_sharp,
                          ),
                          CustomDropdownMenu(
                            listItem: characterClassesList,
                            onChanged: (value) {
                              _classValue = value;
                            },
                            initialValue: characterClassesList.first,
                          ),
                          const SizedBox(height: 20),
                          const DescriberOfTextField(
                            title: 'Race',
                            icon: Icons.group_sharp,
                          ),
                          CustomDropdownMenu(
                            listItem: characterRacesList,
                            onChanged: (value) {
                              _raceValue = value;
                            },
                            initialValue: characterRacesList.first,
                          ),
                          const SizedBox(height: 120),
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
