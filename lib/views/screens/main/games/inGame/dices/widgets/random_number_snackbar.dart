import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../utils/const/app_colors.dart';
import '../../../../../../../widgets/buttons/default_button.dart';

void showRandomNumberRoll(
    BuildContext context, List<AnimatedText> randoms, String diceName) async {
  context.mounted
      ? showDialog(
          context: context,
          builder: (BuildContext context) => _randomNumberRollPopup(
            context,
            randoms,
            diceName,
          ),
        )
      : null;
}

Widget _randomNumberRollPopup(
  BuildContext context,
  final List<AnimatedText> randoms,
  String diceName,
) {
  return AlertDialog(
    backgroundColor: AppColors.darkerGrey,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Rolling ${diceName.toUpperCase()}',
          style: DefaultTextTheme.titilliumWebBold20(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          'assets/images/$diceName.svg',
          width: 20,
          height: 20,
          fit: BoxFit.fill,
        ),
      ],
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          repeatForever: false,
          isRepeatingAnimation: true,
          animatedTexts: randoms,
          pause: const Duration(milliseconds: 0),
        ),
      ],
    ),
    actions: <Widget>[
      DefaultButton(
        text: "Close",
        function: () {
          Navigator.of(context).pop();
        },
        textStyle: DefaultTextTheme.titilliumWebBold16(context)!
            .copyWith(color: AppColors.lighterGrey),
      ),
    ],
  );
}
