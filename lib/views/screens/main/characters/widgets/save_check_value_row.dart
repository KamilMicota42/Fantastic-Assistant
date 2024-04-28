import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/dnd_rules/dnd_rules.dart';
import '../../../../../utils/global_var/default_text_theme.dart';

class SaveCheckValueRow extends StatelessWidget {
  final String name;
  final int? attValue;
  final int? profValue;
  final bool? boolValue;
  const SaveCheckValueRow({
    super.key,
    required this.name,
    required this.attValue,
    required this.profValue,
    required this.boolValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: DefaultTextTheme.titilliumWebRegular16(context)!
              .copyWith(color: AppColors.white),
        ),
        const Expanded(child: SizedBox()),
        Text(
          '${DndRules.formatAttributeToSaveCheck(attValue, profValue, boolValue)}',
          style: DefaultTextTheme.titilliumWebRegular16(context)!
              .copyWith(color: AppColors.white),
        ),
        Checkbox(
          value: boolValue ?? false,
          onChanged: (value) {},
          activeColor: AppColors.white,
          side: const BorderSide(color: AppColors.lighterGrey),
          shape: const CircleBorder(),
        )
      ],
    );
  }
}
