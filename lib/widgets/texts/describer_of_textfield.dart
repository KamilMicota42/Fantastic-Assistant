import 'package:flutter/material.dart';

import '../../utils/global_var/default_text_theme.dart';

class DescriberOfTextField extends StatelessWidget {
  final String title;
  final IconData icon;
  const DescriberOfTextField({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: DefaultTextTheme.titilliumWebRegular16(context),
        ),
        Icon(icon),
      ],
    );
  }
}
