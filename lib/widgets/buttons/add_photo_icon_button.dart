import 'package:flutter/material.dart';

import '../../utils/const/app_colors.dart';

class AddPhotoIconButton extends StatelessWidget {
  final Function onTapFunction;
  const AddPhotoIconButton({
    super.key,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.grey,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        splashColor: AppColors.white,
        style: const ButtonStyle(),
        iconSize: 75,
        icon: const Icon(
          Icons.photo_camera,
          color: AppColors.white,
        ),
        onPressed: () {
          onTapFunction();
        },
      ),
    );
  }
}
