import 'package:fantastic_assistant/models/characters/character_model/character_attributes.dart';
import 'package:fantastic_assistant/models/characters/character_model/character_prof_skills.dart';
import 'package:flutter/material.dart';

import 'skill_row.dart';

class SkillsContainer extends StatelessWidget {
  final CharacterProfSkills? characterProfSkills;
  final CharacterAttributes? characterAttributes;
  final int characterProficiency;
  const SkillsContainer({
    super.key,
    required this.characterProfSkills,
    required this.characterAttributes,
    required this.characterProficiency,
  });

  @override
  Widget build(BuildContext context) {
    if (characterProfSkills != null && characterAttributes != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            SkillRow(
              skillName: 'Acrobatics',
              characterAttribute: characterAttributes!.dexterity,
              isCharacterProfInSkill: characterProfSkills!.acrobatics ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Animal handling',
              characterAttribute: characterAttributes!.wisdom,
              isCharacterProfInSkill: characterProfSkills!.animalHandling ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Arcana',
              characterAttribute: characterAttributes!.intelligence,
              isCharacterProfInSkill: characterProfSkills!.arcana ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Athletics',
              characterAttribute: characterAttributes!.strength,
              isCharacterProfInSkill: characterProfSkills!.athletics ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Deception',
              characterAttribute: characterAttributes!.charisma,
              isCharacterProfInSkill: characterProfSkills!.deception ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'History',
              characterAttribute: characterAttributes!.intelligence,
              isCharacterProfInSkill: characterProfSkills!.history ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Insight',
              characterAttribute: characterAttributes!.wisdom,
              isCharacterProfInSkill: characterProfSkills!.insight ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Intimidation',
              characterAttribute: characterAttributes!.charisma,
              isCharacterProfInSkill: characterProfSkills!.intimidation ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Investigation',
              characterAttribute: characterAttributes!.intelligence,
              isCharacterProfInSkill: characterProfSkills!.investigation ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Medicine',
              characterAttribute: characterAttributes!.wisdom,
              isCharacterProfInSkill: characterProfSkills!.medicine ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Nature',
              characterAttribute: characterAttributes!.intelligence,
              isCharacterProfInSkill: characterProfSkills!.nature ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Perception',
              characterAttribute: characterAttributes!.wisdom,
              isCharacterProfInSkill: characterProfSkills!.perception ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Performance',
              characterAttribute: characterAttributes!.charisma,
              isCharacterProfInSkill: characterProfSkills!.performance ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Persuasion',
              characterAttribute: characterAttributes!.charisma,
              isCharacterProfInSkill: characterProfSkills!.persuasion ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Religion',
              characterAttribute: characterAttributes!.intelligence,
              isCharacterProfInSkill: characterProfSkills!.religion ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Sleight of hand',
              characterAttribute: characterAttributes!.dexterity,
              isCharacterProfInSkill: characterProfSkills!.sleightOfHand ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Stealth',
              characterAttribute: characterAttributes!.dexterity,
              isCharacterProfInSkill: characterProfSkills!.stealth ?? false,
              characterProficiency: characterProficiency,
            ),
            SkillRow(
              skillName: 'Survival',
              characterAttribute: characterAttributes!.wisdom,
              isCharacterProfInSkill: characterProfSkills!.survival ?? false,
              characterProficiency: characterProficiency,
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
