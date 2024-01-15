import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../utils/methods/format_att_to_save_check.dart';

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
              .copyWith(color: AppColors.black),
        ),
        const Expanded(child: SizedBox()),
        Text(
          '${formatAttributeToSaveCheck(attValue, profValue, boolValue)}',
          style: DefaultTextTheme.titilliumWebRegular16(context)!
              .copyWith(color: AppColors.black),
        ),
        Checkbox(
          value: boolValue ?? false,
          onChanged: (value) {},
          activeColor: AppColors.black,
          shape: const CircleBorder(),
        )
      ],
    );
  }
}
