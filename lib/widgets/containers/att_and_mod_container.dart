import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/dnd_rules/dnd_rules.dart';

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
                colorFilter:
                    const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
              Center(
                child: Text(
                  DndRules.attributeToModifier(
                          int.parse(attributeValue.toString()))
                      .toString(),
                  style: DefaultTextTheme.titilliumWebRegular16(context),
                ),
              ),
              LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.only(bottom: constraints.maxHeight / 11),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      attributeValue.toString(),
                      style: DefaultTextTheme.titilliumWebRegular13(context),
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
