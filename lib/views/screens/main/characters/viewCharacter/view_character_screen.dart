import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/models/characters/character_model/character_model.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character.dart';
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

@RoutePage()
class ViewCharacterScreen extends StatefulWidget {
  const ViewCharacterScreen({super.key});

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
                              getIt<AppRouter>().navigate(const CharactersRoute());
                            },
                            rightSideWidget: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit_sharp),
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
                                child: CharacterPicture(pathToPicture: state!.characterPathToPicture),
                              ),
                              const SizedBox(height: 6),
                              TitleLeft(
                                text: state.characterName!,
                              ),
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
                              const SizedBox(height: 6),
                              const DefaultDivider(),
                              const TitleLeft(text: 'Attributes'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 110,
                                    height: 110,
                                    child: AttAndModContainer(attributeValue: state.characterAttributes?.strength ?? 0),
                                  ),
                                  SizedBox(
                                    width: 110,
                                    height: 110,
                                    child: AttAndModContainer(attributeValue: state.characterAttributes?.dexterity ?? 0),
                                  ),
                                  SizedBox(
                                    width: 110,
                                    height: 110,
                                    child: AttAndModContainer(attributeValue: state.characterAttributes?.constitution ?? 0),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 110,
                                    height: 110,
                                    child: AttAndModContainer(attributeValue: state.characterAttributes?.intelligence ?? 0),
                                  ),
                                  SizedBox(
                                    width: 110,
                                    height: 110,
                                    child: AttAndModContainer(attributeValue: state.characterAttributes?.wisdom ?? 0),
                                  ),
                                  SizedBox(
                                    width: 110,
                                    height: 110,
                                    child: AttAndModContainer(attributeValue: state.characterAttributes?.charisma ?? 0),
                                  ),
                                ],
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
