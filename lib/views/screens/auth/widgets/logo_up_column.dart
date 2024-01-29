import 'package:flutter/material.dart';

import '../../../../widgets/buttons/go_back_title_row.dart';

class LogoUpColumn extends StatelessWidget {
  final String? screenTitle;
  const LogoUpColumn({
    this.screenTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoBackTitleRow(
          screenTitle: screenTitle,
        ),
        Image.asset(
          'assets/images/logo_wo_background.png',
          width: 150,
          height: 150,
        ),
      ],
    );
  }
}
