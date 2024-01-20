import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:flutter/material.dart';

class AuthBackgroundContainer extends StatefulWidget {
  final Widget child;
  final ScrollPhysics? physics;
  const AuthBackgroundContainer({
    super.key,
    required this.child,
    this.physics,
  });

  @override
  State<AuthBackgroundContainer> createState() => _AuthBackgroundContainerState();
}

class _AuthBackgroundContainerState extends State<AuthBackgroundContainer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: widget.physics ?? const ClampingScrollPhysics(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
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
        ),
      ),
    );
  }
}
