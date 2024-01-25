import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/models/characters/character_model/character_model.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character.dart';
import 'package:fantastic_assistant/views/screens/main/characters/viewCharacter/widgets/skills_container.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/character_picture.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/go_back_title_row.dart';
import 'package:fantastic_assistant/widgets/others/default_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/injection.dart';
import '../../../../../settings/routes/app_router.dart';
import '../../../../../settings/routes/app_router.gr.dart';
import '../../../../../widgets/containers/att_and_mod_container.dart';
import '../widgets/description_left.dart';
import '../widgets/title_left.dart';
import '../widgets/value_and_description.dart';
import 'widgets/character_notes.dart';
import 'widgets/save_checks_container.dart';

@RoutePage()
class ViewCharacterScreen extends StatefulWidget {
  final bool? asDm;
  const ViewCharacterScreen({
    super.key,
    this.asDm,
  });

  @override
  State<ViewCharacterScreen> createState() => _ViewCharacterScreenState();
}

class _ViewCharacterScreenState extends State<ViewCharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: BlocBuilder<CurrentCharacterCubit, CharacterModel?>(
              bloc: getIt<CurrentCharacterCubit>(),
              builder: (context, state) {
                return Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GoBackTitleRow(
                            screenTitle: "View character",
                            popFunction: () {
                              getIt<AppRouter>().pop();
                            },
                            rightSideWidget: widget.asDm == true
                                ? null
                                : IconButton(
                                    onPressed: () {
                                      getIt<AppRouter>().navigate(const EditCharacterRoute());
                                    },
                                    icon: const Icon(
                                      Icons.edit_sharp,
                                      color: AppColors.white,
                                    ),
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
                              SizedBox(
                                height: MediaQuery.of(context).size.width - 100,
                                width: MediaQuery.of(context).size.width - 100,
                                child: CharacterPicture(pathToPicture: state?.characterPathToPicture),
                              ),
                              const SizedBox(height: 20),
                              TitleLeft(
                                text: state!.characterName ?? '',
                              ),
                              const DefaultDivider(),
                              const SizedBox(height: 6),
                              DescriptionLeft(
                                text: '${state.characterRace} | ${state.characterClass} | Level ${state.characterLevel}',
                              ),
                              DescriptionLeft(
                                text: 'Hit Points ${state.characterBasicInfo?.currentHp ?? '0'}/${state.characterBasicInfo?.maxHp ?? '0'}',
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ValueAndDescription(
                                    value:
                                        '${(state.characterBasicInfo?.proficiency ?? 0) > 0 ? '+' : ''} ${state.characterBasicInfo?.proficiency.toString() ?? '0'}',
                                    description: 'Prof. Bonus',
                                  ),
                                  ValueAndDescription(
                                    value: '${state.characterBasicInfo?.speed.toString() ?? '0'} ft.',
                                    description: 'Wlk. Speed',
                                  ),
                                  ValueAndDescription(
                                    value:
                                        '${(state.characterBasicInfo?.initiative ?? 0) > 0 ? '+' : ''} ${state.characterBasicInfo?.initiative.toString() ?? '0'}',
                                    description: 'Initiative',
                                  ),
                                  ValueAndDescription(
                                    value: state.characterBasicInfo?.armorClass.toString() ?? '0',
                                    description: 'Armor Class',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const TitleLeft(text: 'Attributes'),
                              const DefaultDivider(),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AttAndModContainer(
                                    attributeName: 'Strength',
                                    attributeValue: state.characterAttributes?.strength ?? 0,
                                  ),
                                  AttAndModContainer(
                                    attributeName: 'Dexterity',
                                    attributeValue: state.characterAttributes?.dexterity ?? 0,
                                  ),
                                  AttAndModContainer(
                                    attributeName: 'Constitution',
                                    attributeValue: state.characterAttributes?.constitution ?? 0,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AttAndModContainer(
                                    attributeName: 'Intelligence',
                                    attributeValue: state.characterAttributes?.intelligence ?? 0,
                                  ),
                                  AttAndModContainer(
                                    attributeName: 'Wisdom',
                                    attributeValue: state.characterAttributes?.wisdom ?? 0,
                                  ),
                                  AttAndModContainer(
                                    attributeName: 'Charisma',
                                    attributeValue: state.characterAttributes?.charisma ?? 0,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const TitleLeft(text: 'Saving Throws'),
                              const DefaultDivider(),
                              const SizedBox(height: 6),
                              SaveChecksContainer(
                                characterModel: state,
                              ),
                              const TitleLeft(text: 'Skills'),
                              const DefaultDivider(),
                              const SizedBox(height: 6),
                              SkillsContainer(
                                characterProfSkills: state.characterProfSkills,
                                characterAttributes: state.characterAttributes,
                                characterProficiency: state.characterBasicInfo?.proficiency ?? 0,
                              ),
                              const SizedBox(height: 20),
                              const TitleLeft(text: 'Notes'),
                              const DefaultDivider(),
                              const SizedBox(height: 6),
                              CharacterNotesWidget(
                                listOfNotes: state.characterNotes!,
                              ),
                              const SizedBox(height: 120),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
