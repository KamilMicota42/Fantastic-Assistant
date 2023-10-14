import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> listItem;
  final Function onChanged;
  const CustomDropdownMenu({
    super.key,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          width: constraints.constrainWidth(),
          child: DropdownMenu(
            width: constraints.constrainWidth(),
            // trailingIcon: SvgPicture.asset(
            //   'assets/icons/arrow.svg',
            // ),
            // selectedTrailingIcon: RotationTransition(
            //   turns: const AlwaysStoppedAnimation(180 / 360),
            //   child: SvgPicture.asset(
            //     'assets/icons/arrow.svg',
            //   ),
            // ),
            initialSelection: widget.listItem.first,
            onSelected: (String? value) {
              widget.onChanged();
              setState(
                () {
                  dropdownValue = value!;
                },
              );
            },
            dropdownMenuEntries:
                widget.listItem.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(
                value: value,
                label: value,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
