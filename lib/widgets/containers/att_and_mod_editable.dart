import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:fantastic_assistant/utils/methods/data_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/const/app_colors.dart';
import '../../utils/dnd_rules/dnd_rules.dart';

class AttAndModEditable extends StatefulWidget {
  final String attributeName;
  final TextEditingController controller;
  const AttAndModEditable({
    super.key,
    required this.attributeName,
    required this.controller,
  });

  @override
  State<AttAndModEditable> createState() => _AttAndModEditableState();
}

class _AttAndModEditableState extends State<AttAndModEditable> {
  int modValue = 0;

  @override
  void initState() {
    if (DataValidatin.isAttributeValid(widget.controller.text)) {
      modValue = int.parse(DndRules.attributeToModifier(int.parse(widget.controller.text.toString())).toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.attributeName,
          style: DefaultTextTheme.titilliumWebRegular16(context),
        ),
        SizedBox(
          width: 110,
          height: 110,
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/images/att_mod_background.svg',
                colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
              Center(
                child: Text(
                  modValue.toString(),
                  style: DefaultTextTheme.titilliumWebRegular16(context),
                ),
              ),
              LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.only(bottom: constraints.maxHeight / 11),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 40,
                      height: 33,
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if (!hasFocus) {
                            if (!DataValidatin.isAttributeValid(widget.controller.text)) {
                              widget.controller.text = '10';
                            }
                            setState(() {});
                          }
                        },
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: DefaultTextTheme.titilliumWebRegular13(context),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          controller: widget.controller,
                          onChanged: (v) {
                            if (DataValidatin.isAttributeValid(v)) {
                              modValue = int.parse(DndRules.attributeToModifier(int.parse(widget.controller.text.toString())).toString());
                            } else {
                              modValue = 0;
                            }
                            setState(() {});
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\-?\d*')),
                          ],
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
