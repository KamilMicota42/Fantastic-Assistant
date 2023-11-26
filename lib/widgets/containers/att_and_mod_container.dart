import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/dnd_rules/attribute_to_modifier.dart';

class AttAndModContainer extends StatelessWidget {
  final int attributeValue;
  const AttAndModContainer({
    super.key,
    required this.attributeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/att_mod_background.svg',
        ),
        Center(
          child: Text(attributeToModifier(int.parse(attributeValue.toString())).toString()),
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
    );
  }
}
