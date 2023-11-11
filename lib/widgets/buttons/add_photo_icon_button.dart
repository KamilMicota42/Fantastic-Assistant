import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/const/app_colors.dart';

class AddPhotoIconButton extends StatefulWidget {
  final Function onTapFunction;
  const AddPhotoIconButton({
    super.key,
    required this.onTapFunction,
  });

  @override
  State<AddPhotoIconButton> createState() => _AddPhotoIconButtonState();
}

class _AddPhotoIconButtonState extends State<AddPhotoIconButton> {
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return _image == null
        ? ClipOval(
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: AppColors.lighterGrey,
              ),
              child: IconButton(
                splashColor: AppColors.white,
                style: const ButtonStyle(),
                icon: const Icon(
                  Icons.add_photo_alternate_rounded,
                  size: 100,
                  color: AppColors.darkerGrey,
                ),
                onPressed: () async {
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    widget.onTapFunction(File(pickedFile.path));
                  }
                  setState(
                    () {
                      if (pickedFile != null) {
                        _image = File(pickedFile.path);
                      }
                    },
                  );
                },
              ),
            ),
          )
        : ClipOval(
            child: InkWell(
              onTap: () {
                widget.onTapFunction(null);
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
}
