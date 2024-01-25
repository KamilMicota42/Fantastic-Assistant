import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/const/app_colors.dart';

class AddPhotoIconButton extends StatefulWidget {
  final String? initialImageUrl;
  final Function onTapFunction;
  final Function onChange;
  const AddPhotoIconButton({
    super.key,
    this.initialImageUrl,
    required this.onTapFunction,
    required this.onChange,
  });

  @override
  State<AddPhotoIconButton> createState() => _AddPhotoIconButtonState();
}

class _AddPhotoIconButtonState extends State<AddPhotoIconButton> {
  File? _image;
  bool orgPicture = true;
  final picker = ImagePicker();

  @override
  void initState() {
    widget.initialImageUrl != null ? orgPicture = true : orgPicture = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (orgPicture) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          onTap: () {
            orgPicture = false;
            widget.onChange();
            setState(() {});
          },
          child: CachedNetworkImage(
            imageUrl: widget.initialImageUrl!,
            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(
              strokeWidth: 2,
              value: downloadProgress.progress,
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.person_sharp,
              color: AppColors.darkerGrey,
            ),
            fit: BoxFit.fill,
          ),
        ),
      );
    } else {
      return _image == null
          ? Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.semiWhite,
                borderRadius: BorderRadius.circular(6),
              ),
              child: IconButton(
                splashColor: AppColors.black,
                style: const ButtonStyle(),
                icon: const Icon(
                  Icons.add_photo_alternate_rounded,
                  size: 100,
                  color: AppColors.darkerGrey,
                ),
                onPressed: () async {
                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    widget.onTapFunction(File(pickedFile.path));
                  }
                  widget.onChange();
                  setState(
                    () {
                      if (pickedFile != null) {
                        _image = File(pickedFile.path);
                      }
                    },
                  );
                },
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: InkWell(
                onTap: () {
                  widget.onTapFunction(null);
                  widget.onChange();
                  setState(
                    () {
                      _image = null;
                    },
                  );
                },
                child: Image.file(
                  _image!,
                  fit: BoxFit.fill,
                  width: 150,
                  height: 150,
                ),
              ),
            );
    }
    // return _image == null
    //     ? Container(
    //         width: 150,
    //         height: 150,
    //         decoration: BoxDecoration(
    //           color: AppColors.semiWhite,
    //           borderRadius: BorderRadius.circular(6),
    //         ),
    //         child: IconButton(
    //           splashColor: AppColors.black,
    //           style: const ButtonStyle(),
    //           icon: const Icon(
    //             Icons.add_photo_alternate_rounded,
    //             size: 100,
    //             color: AppColors.semiWhite,
    //           ),
    //           onPressed: () async {
    //             final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    //             if (pickedFile != null) {
    //               widget.onTapFunction(File(pickedFile.path));
    //             }
    //             setState(
    //               () {
    //                 if (pickedFile != null) {
    //                   _image = File(pickedFile.path);
    //                 }
    //               },
    //             );
    //           },
    //         ),
    //       )
    //     : ClipRRect(
    //         borderRadius: BorderRadius.circular(6),
    //         child: InkWell(
    //           onTap: () {
    //             widget.onTapFunction(null);
    //             setState(
    //               () {
    //                 _image = null;
    //               },
    //             );
    //           },
    //           child: Image.file(
    //             _image!,
    //             fit: BoxFit.fill,
    //             width: 150,
    //             height: 150,
    //           ),
    //         ),
    //       );
  }
}
