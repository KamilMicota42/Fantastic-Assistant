import 'package:flutter/material.dart';

import '../../settings/injection.dart';
import '../../settings/routes/app_router.dart';
import '../../utils/const/app_colors.dart';

class GoBackIconButton extends StatelessWidget {
  const GoBackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {
          getIt<AppRouter>().pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.darkerGrey,
        ),
      ),
    );
  }
}
