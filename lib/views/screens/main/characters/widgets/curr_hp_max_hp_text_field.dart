import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  void initState() {
    widget.currentHpController.text != '' ? currValueText = widget.currentHpController.text : null;
    widget.maxHpController.text != '' ? maxValueText = widget.maxHpController.text : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                        child: Focus(
                          onFocusChange: (hasFocus) {
                            if (!isIntable(widget.currentHpController.text)) {
                              widget.currentHpController.text = '0';
                            }
                          },
                          child: DefaultTextFieldWLabel(
                            textController: widget.currentHpController,
                            labelText: 'Curr HP',
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
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'^\-?\d*')),
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                        child: Focus(
                          onFocusChange: (hasFocus) {
                            if (!isIntable(widget.maxHpController.text)) {
                              widget.maxHpController.text = '0';
                            }
                          },
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
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'^\-?\d*')),
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Center(
                      child: Text(
                        '$currValueText / $maxValueText',
                        style: DefaultTextTheme.titilliumWebBold16(context)!.copyWith(overflow: TextOverflow.clip),
                      ),
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
