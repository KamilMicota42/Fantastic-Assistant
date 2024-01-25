import 'package:fantastic_assistant/utils/dnd_rules/attribute_to_modifier.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/const/app_colors.dart';
import '../../../../../../utils/global_var/default_text_theme.dart';

class SkillRow extends StatelessWidget {
  final String skillName;
  final int? characterAttribute;
  final bool isCharacterProfInSkill;
  final int? characterProficiency;
  const SkillRow({
    super.key,
    required this.skillName,
    required this.characterAttribute,
    required this.isCharacterProfInSkill,
    required this.characterProficiency,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          skillName,
          style: DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(color: AppColors.white),
        ),
        Expanded(
          child: Text(
            '${attributeToModifier(characterAttribute ?? 0) + (isCharacterProfInSkill ? characterProficiency ?? 0 : 0)}',
            style: DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(color: AppColors.white),
            textAlign: TextAlign.end,
          ),
        ),
        Checkbox(
          value: isCharacterProfInSkill,
          onChanged: (value) {},
          activeColor: AppColors.white,
          side: const BorderSide(color: AppColors.lighterGrey),
          shape: const CircleBorder(),
        )
      ],
    );
  }
}
