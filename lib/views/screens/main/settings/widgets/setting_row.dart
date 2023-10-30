import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';

class SettingRow extends StatelessWidget {
  final String text;
  final Function onTap;
  const SettingRow({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      height: 40,
      child: TextButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.zero,
          ),
          overlayColor: const MaterialStatePropertyAll(
            AppColors.lighterGrey,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
