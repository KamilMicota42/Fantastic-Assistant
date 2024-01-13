import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:fantastic_assistant/utils/methods/data_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/dnd_rules/attribute_to_modifier.dart';

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
    if (isAttributeValid(widget.controller.text)) {
      modValue = int.parse(attributeToModifier(int.parse(widget.controller.text.toString())).toString());
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
              ),
              Center(
                child: Text(modValue.toString()),
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
                            if (!isAttributeValid(widget.controller.text)) {
                              widget.controller.text = '10';
                            }
                            setState(() {});
                          }
                        },
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: DefaultTextTheme.titilliumWebRegular12(context)!.copyWith(),
                          decoration: const InputDecoration(contentPadding: EdgeInsets.zero),
                          controller: widget.controller,
                          onChanged: (v) {
                            if (isAttributeValid(v)) {
                              modValue = int.parse(attributeToModifier(int.parse(widget.controller.text.toString())).toString());
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
