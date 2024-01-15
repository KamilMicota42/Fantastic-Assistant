import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/dnd_rules/attribute_to_modifier.dart';

class AttAndModContainer extends StatelessWidget {
  final String attributeName;
  final int attributeValue;
  const AttAndModContainer({
    super.key,
    required this.attributeName,
    required this.attributeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          attributeName,
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
                child: Text(
                    attributeToModifier(int.parse(attributeValue.toString()))
                        .toString()),
              ),
              LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.only(bottom: constraints.maxHeight / 11),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(attributeValue.toString()),
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
