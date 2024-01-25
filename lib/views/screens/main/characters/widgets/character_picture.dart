import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';

class CharacterPicture extends StatelessWidget {
  final String? pathToPicture;
  const CharacterPicture({
    super.key,
    required this.pathToPicture,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
      child: pathToPicture != null
          ? CachedNetworkImage(
              imageUrl: pathToPicture!,
              progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(
                strokeWidth: 2,
                value: downloadProgress.progress,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.person_sharp),
              fit: BoxFit.fill,
            )
          : Container(
              decoration: const BoxDecoration(
                color: AppColors.semiWhite,
              ),
              child: const FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.person_sharp,
                  color: AppColors.darkerGrey,
                ),
              ),
            ),
    );
  }
}
