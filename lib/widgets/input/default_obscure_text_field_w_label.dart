import 'package:flutter/material.dart';

import '../../utils/const/app_colors.dart';
import '../../utils/global_var/default_text_theme.dart';

class DefaultObscureTextFieldWLabel extends StatefulWidget {
  const DefaultObscureTextFieldWLabel({
    super.key,
    required this.textController,
    required this.labelText,
    required this.textObscure,
    required this.onPressedFunction,
  });

  final TextEditingController textController;
  final String labelText;
  final bool textObscure;
  final Function onPressedFunction;

  @override
  State<DefaultObscureTextFieldWLabel> createState() =>
      _DefaultObscureTextFieldWLabelState();
}

class _DefaultObscureTextFieldWLabelState
    extends State<DefaultObscureTextFieldWLabel> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      style: DefaultTextTheme.titilliumWebBold20(context)!
          .copyWith(color: AppColors.semiWhite, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: DefaultTextTheme.titilliumWebBold20(context)!
            .copyWith(color: AppColors.greenWhite),
        suffixIcon: IconButton(
          alignment: Alignment.bottomCenter,
          onPressed: () {
            widget.onPressedFunction();
          },
          icon: Icon(
            widget.textObscure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.greenWhite,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.semiWhite,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white,
          ),
        ),
      ),
      obscureText: widget.textObscure,
    );
  }
}
