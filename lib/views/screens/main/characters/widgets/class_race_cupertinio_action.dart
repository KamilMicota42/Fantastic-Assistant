import 'package:flutter/material.dart';

class ClassRaceCupertionioAction extends StatefulWidget {
  final String regionString;
  final Function changeRegion;
  const ClassRaceCupertionioAction(
      {super.key, required this.regionString, required this.changeRegion});

  @override
  State<ClassRaceCupertionioAction> createState() =>
      _ClassRaceCupertionioActionState();
}

class _ClassRaceCupertionioActionState
    extends State<ClassRaceCupertionioAction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onTap: () {},
          readOnly: true,
          decoration: InputDecoration(
            hintText: widget.regionString,
            //hintStyle: const TextStyle(color: AppColors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  //color: AppColors.semiWhite,
                  ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  //color: AppColors.semiWhite,
                  ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                  //color: AppColors.semiWhite,
                  ),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.arrow_downward),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
