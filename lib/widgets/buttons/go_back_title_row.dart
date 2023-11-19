import 'package:flutter/material.dart';

import '../../settings/injection.dart';
import '../../settings/routes/app_router.dart';
import '../../utils/const/app_colors.dart';
import '../../utils/global_var/default_text_theme.dart';

class GoBackTitleRow extends StatelessWidget {
  final String? screenTitle;
  final Function? popFunction;
  final bool? isX;
  const GoBackTitleRow({
    this.screenTitle,
    this.popFunction,
    this.isX,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 30,
            height: 50,
            child: IconButton(
              onPressed: () {
                if (popFunction == null) {
                  getIt<AppRouter>().pop();
                } else {
                  popFunction!();
                }
              },
              icon: Icon(
                isX == true ? Icons.close_sharp : Icons.arrow_back_ios,
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
            height: 50,
          )
        ],
      ),
    );
  }
}
