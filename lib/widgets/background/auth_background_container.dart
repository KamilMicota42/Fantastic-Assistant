import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:flutter/material.dart';

class AuthBackgroundContainer extends StatefulWidget {
  final Widget child;
  const AuthBackgroundContainer({super.key, required this.child});

  @override
  State<AuthBackgroundContainer> createState() =>
      _AuthBackgroundContainerState();
}

class _AuthBackgroundContainerState extends State<AuthBackgroundContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.white,
            AppColors.lighterGrey,
          ],
        ),
      ),
      child: widget.child,
    );
  }
}
