import 'package:flutter/material.dart';

import '../../settings/injection.dart';
import '../../settings/routes/app_router.dart';
import '../../utils/const/app_colors.dart';
import '../../utils/global_var/default_text_theme.dart';

class GoBackTitleRow extends StatelessWidget {
  final String? screenTitle;
  const GoBackTitleRow({
    this.screenTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 30,
          child: IconButton(
            onPressed: () {
              getIt<AppRouter>().pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.darkerGrey,
            ),
          ),
        ),
        screenTitle != null
            ? Text(
                screenTitle!,
                style: DefaultTextTheme.titilliumWebBold22(context)!
                    .copyWith(color: AppColors.black),
              )
            : const SizedBox(),
        const SizedBox(
          width: 30,
        )
      ],
    );
  }
}
