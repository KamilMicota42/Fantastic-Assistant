import 'package:fantastic_assistant/utils/methods/data_validation.dart';
import 'package:fantastic_assistant/widgets/input/default_text_field_w_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../utils/const/app_colors.dart';
import '../../../../../../utils/global_var/default_text_theme.dart';

class TextfieldAndDescription extends StatelessWidget {
  final TextEditingController controller;
  final String description;
  final String? defValueIfNotCorrect;
  const TextfieldAndDescription({
    super.key,
    required this.controller,
    required this.description,
    this.defValueIfNotCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 200,
      child: Column(
        children: [
          Focus(
            child: DefaultTextFieldWLabel(
              onChanged: (value) {
                if (isIntable(value)) {
                  controller.text = value;
                }
              },
              textController: controller,
              labelText: '',
              alignText: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\-?\d*')),
              ],
              keyboardType: TextInputType.number,
            ),
            onFocusChange: (hasFocus) {
              if (!isIntable(controller.text) && defValueIfNotCorrect != null) {
                controller.text = defValueIfNotCorrect!;
              }
            },
          ),
          Text(
            description,
            style: DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
