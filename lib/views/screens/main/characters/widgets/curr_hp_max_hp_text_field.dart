import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../utils/methods/data_validation.dart';
import '../../../../../widgets/input/default_text_field_w_label.dart';
import '../logic/show_hint.dart';

class CurrHpMaxHpTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController currentHpController;
  final TextEditingController maxHpController;
  const CurrHpMaxHpTextField({
    super.key,
    this.hintText,
    required this.currentHpController,
    required this.maxHpController,
  });

  @override
  State<CurrHpMaxHpTextField> createState() => _CurrHpMaxHpTextFieldState();
}

class _CurrHpMaxHpTextFieldState extends State<CurrHpMaxHpTextField> {
  String currValueText = '0';
  String maxValueText = '0';

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
                    '$currValueText / $maxValueText',
                    style: DefaultTextTheme.titilliumWebBold16(context),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    child: DefaultTextFieldWLabel(
                      textController: widget.currentHpController,
                      labelText: 'Current HP',
                      alignText: TextAlign.center,
                      alignLabel: FloatingLabelAlignment.center,
                      onChanged: (value) {
                        setState(
                          () {
                            if (isIntable(value)) {
                              currValueText = int.parse(value).toString();
                            } else {
                              currValueText = "0";
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    child: DefaultTextFieldWLabel(
                      textController: widget.maxHpController,
                      labelText: 'Max HP',
                      alignText: TextAlign.center,
                      alignLabel: FloatingLabelAlignment.center,
                      onChanged: (value) {
                        setState(
                          () {
                            if (isIntable(value)) {
                              maxValueText = int.parse(value).toString();
                            } else {
                              maxValueText = "0";
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
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
