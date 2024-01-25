import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final String text;
  final VoidCallback function;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final IconData? icon;
  const DefaultButton({
    super.key,
    required this.text,
    required this.function,
    this.width,
    this.height,
    this.textStyle,
    this.icon,
  });

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.iris.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(AppColors.black),
          shadowColor: const MaterialStatePropertyAll(AppColors.iris),
          surfaceTintColor: const MaterialStatePropertyAll(AppColors.iris),
          overlayColor: MaterialStatePropertyAll(AppColors.lighterIris.withOpacity(0.5)),
        ),
        onPressed: () {
          widget.function();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: widget.textStyle ?? DefaultTextTheme.titilliumWebBold16(context)!.copyWith(color: AppColors.white),
            ),
            widget.icon != null
                ? Icon(
                    widget.icon,
                    color: AppColors.white,
                    size: 16,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
