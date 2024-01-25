import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../../utils/const/app_colors.dart';

class ScenePictureInGame extends StatelessWidget {
  final String? pathToPicture;
  final double width;
  final double height;
  const ScenePictureInGame({
    super.key,
    required this.pathToPicture,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
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
                errorWidget: (context, url, error) => const Icon(Icons.games_rounded),
                fit: BoxFit.fill,
              )
            : Container(
                decoration: const BoxDecoration(
                  color: AppColors.semiWhite,
                ),
                child: const FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    Icons.games_rounded,
                    color: AppColors.darkerGrey,
                  ),
                ),
              ),
      ),
    );
  }
}
