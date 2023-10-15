import 'package:flutter/material.dart';

import '../../../../widgets/buttons/go_back_icon_button.dart';

class LogoUpColumn extends StatelessWidget {
  const LogoUpColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const GoBackIconButton(),
        Image.asset(
          'assets/images/logo.png',
          width: 200,
          height: 200,
        ),
      ],
    );
  }
}
