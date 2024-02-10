import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/dnd_rules/dnd_rules.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../utils/methods/data_validation.dart';
import '../../../../../widgets/input/default_text_field_w_label.dart';

class AttributeAndModifier extends StatefulWidget {
  final String valueName;
  final TextEditingController valueController;
  const AttributeAndModifier({
    super.key,
    required this.valueName,
    required this.valueController,
  });

  @override
  State<AttributeAndModifier> createState() => _AttributeAndModifierState();
}

class _AttributeAndModifierState extends State<AttributeAndModifier> {
  String valueModifier = "0";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.semiWhite,
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            height: 100,
            child: Center(
              child: Text(
                valueModifier,
                style: DefaultTextTheme.titilliumWebBold16(context),
              ),
            ),
          ),
        ),
        SizedBox(
          child: DefaultTextFieldWLabel(
            textController: widget.valueController,
            labelText: widget.valueName,
            alignText: TextAlign.center,
            alignLabel: FloatingLabelAlignment.center,
            onChanged: (value) {
              setState(() {
                if (DataValidatin.isAttributeValid(value)) {
                  valueModifier = DndRules.attributeToModifier(int.parse(value)).toString();
                } else {
                  valueModifier = "0";
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
