import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../models/characters/character_model/character_model.dart';
import '../../widgets/save_check_value_row.dart';

class SaveChecksContainer extends StatelessWidget {
  final CharacterModel characterModel;
  const SaveChecksContainer({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/save_throw_background.svg',
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SaveCheckValueRow(
                      name: 'Strength',
                      attValue: characterModel.characterAttributes?.strength,
                      profValue: characterModel.characterBasicInfo?.proficiency,
                      boolValue:
                          characterModel.characterProfSaveChecks?.saveStrength,
                    ),
                    SaveCheckValueRow(
                      name: 'Dexterity',
                      attValue: characterModel.characterAttributes?.dexterity,
                      profValue: characterModel.characterBasicInfo?.proficiency,
                      boolValue:
                          characterModel.characterProfSaveChecks?.saveDexterity,
                    ),
                    SaveCheckValueRow(
                      name: 'Constitution',
                      attValue:
                          characterModel.characterAttributes?.constitution,
                      profValue: characterModel.characterBasicInfo?.proficiency,
                      boolValue: characterModel
                          .characterProfSaveChecks?.saveConstitution,
                    ),
                    SaveCheckValueRow(
                      name: 'Intelligence',
                      attValue:
                          characterModel.characterAttributes?.intelligence,
                      profValue: characterModel.characterBasicInfo?.proficiency,
                      boolValue: characterModel
                          .characterProfSaveChecks?.saveIntelligence,
                    ),
                    SaveCheckValueRow(
                      name: 'Wisdom',
                      attValue: characterModel.characterAttributes?.wisdom,
                      profValue: characterModel.characterBasicInfo?.proficiency,
                      boolValue:
                          characterModel.characterProfSaveChecks?.saveWisdom,
                    ),
                    SaveCheckValueRow(
                      name: 'Charisma',
                      attValue: characterModel.characterAttributes?.charisma,
                      profValue: characterModel.characterBasicInfo?.proficiency,
                      boolValue:
                          characterModel.characterProfSaveChecks?.saveCharisma,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
