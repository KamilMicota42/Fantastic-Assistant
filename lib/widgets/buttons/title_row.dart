import 'package:flutter/material.dart';

import '../../utils/const/app_colors.dart';
import '../../utils/global_var/default_text_theme.dart';

class TitleRow extends StatelessWidget {
  final String? screenTitle;
  const TitleRow({
    this.screenTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 30,
            height: 50,
          ),
          screenTitle != null
              ? Text(
                  screenTitle!,
                  style: DefaultTextTheme.titilliumWebBold22(context)!.copyWith(color: AppColors.white),
                )
              : const SizedBox(),
          const SizedBox(
            width: 30,
            height: 50,
          )
        ],
      ),
    );
  }
}
