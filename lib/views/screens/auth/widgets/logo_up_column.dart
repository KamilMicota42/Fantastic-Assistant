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
        const SizedBox(height: 50),
        GoBackTitleRow(
          screenTitle: screenTitle,
        ),
        Image.asset(
          'assets/images/logo.png',
          width: 200,
          height: 200,
        ),
      ],
    );
  }
}
