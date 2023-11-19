import 'package:fantastic_assistant/views/screens/main/characters/logic/show_hint.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../utils/methods/data_validation.dart';
import '../../../../../widgets/input/default_text_field_w_label.dart';

class ValueField extends StatefulWidget {
  final String valueName;
  final TextEditingController valueController;
  final String? hintText;
  const ValueField({
    super.key,
    required this.valueName,
    required this.valueController,
    this.hintText,
  });

  @override
  State<ValueField> createState() => _ValueFieldState();
}

class _ValueFieldState extends State<ValueField> {
  String valueModifier = "0";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.lighterGrey,
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
                  setState(
                    () {
                      if (isIntable(value)) {
                        valueModifier = int.parse(value).toString();
                      } else {
                        valueModifier = "0";
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
        widget.hintText != null
            ? InkWell(
                onTap: () {
                  showHint(context, widget.hintText!);
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.question_mark_sharp,
                      color: AppColors.darkerGrey,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
