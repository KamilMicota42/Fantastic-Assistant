import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final String initialValue;
  final List<String> listItem;
  final Function onChanged;
  const CustomDropdownMenu({
    super.key,
    required this.initialValue,
    required this.listItem,
    required this.onChanged,
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          width: constraints.constrainWidth(),
          child: DropdownMenu(
            menuHeight: 250,
            width: constraints.constrainWidth(),
            trailingIcon: const Icon(Icons.arrow_drop_down_rounded),
            initialSelection: widget.initialValue,
            onSelected: (String? value) {
              setState(
                () {
                  widget.onChanged(value);
                  dropdownValue = value!;
                },
              );
            },
            dropdownMenuEntries: widget.listItem.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(
                value: value,
                label: value,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColors.white),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
