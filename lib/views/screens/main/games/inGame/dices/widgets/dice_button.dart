import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../utils/const/app_colors.dart';
import '../../../../../../../utils/global_var/default_text_theme.dart';

class DiceButton extends StatelessWidget {
  final String assetPath;
  final Function onTap;
  final String diceName;
  const DiceButton({
    required this.assetPath,
    required this.onTap,
    required this.diceName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: IconButton(
            onPressed: () {
              onTap();
            },
            icon: SvgPicture.asset(
              assetPath,
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          diceName,
          style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
