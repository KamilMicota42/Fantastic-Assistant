import 'package:fantastic_assistant/widgets/others/default_divider.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/global_var/default_text_theme.dart';

class ProfControllerRow extends StatefulWidget {
  final String skillName;
  final bool profController;
  final int skillMod;
  final int profMod;
  final Function handleControllerChange;
  const ProfControllerRow({
    super.key,
    required this.skillName,
    required this.profController,
    required this.skillMod,
    required this.profMod,
    required this.handleControllerChange,
  });

  @override
  State<ProfControllerRow> createState() => _ProfControllerRowState();
}

class _ProfControllerRowState extends State<ProfControllerRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DefaultDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.skillName,
                  style: DefaultTextTheme.titilliumWebRegular16(context),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.profController == false
                      ? '${widget.skillMod}'
                      : '${(widget.skillMod + widget.profMod)}',
                  style: DefaultTextTheme.titilliumWebRegular16(context),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Checkbox(
                  value: widget.profController,
                  onChanged: (value) {
                    widget.handleControllerChange(value);
                  },
                ),
              ),
            ),
          ],
        ),
        const DefaultDivider(),
      ],
    );
  }
}
