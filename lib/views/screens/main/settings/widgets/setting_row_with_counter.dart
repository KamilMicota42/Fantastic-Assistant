import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';

class SettingRowWithCounter extends StatelessWidget {
  final String text;
  final int? notificationCounter;
  final Function onTap;
  const SettingRowWithCounter({
    super.key,
    required this.text,
    required this.notificationCounter,
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
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.zero,
          ),
          overlayColor: WidgetStatePropertyAll(
            AppColors.semiWhite,
          ),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(
                color: AppColors.white,
              ),
            ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    onTap();
                  },
                  icon: const Icon(
                    Icons.notifications_sharp,
                    color: AppColors.semiWhite,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: AppColors.semiWhite,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '$notificationCounter',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
