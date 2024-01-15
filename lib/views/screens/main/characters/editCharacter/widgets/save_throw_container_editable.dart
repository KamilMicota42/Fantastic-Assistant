import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/const/app_colors.dart';
import '../../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../../utils/methods/format_att_to_save_check.dart';

class SaveThrowContainerEditable extends StatefulWidget {
  final int profValue;
  //strength
  final int strAtt;
  final bool strSavingThrow;
  final Function swapStrSavingThrow;
  //dexterity
  final int dexAtt;
  final bool dexSavingThrow;
  final Function swapDexSavingThrow;
  //constitution
  final int conAtt;
  final bool conSavingThrow;
  final Function swapConSavingThrow;
  //constitution
  final int intAtt;
  final bool intSavingThrow;
  final Function swapIntSavingThrow;
  //wisdom
  final int wisAtt;
  final bool wisSavingThrow;
  final Function swapWisSavingThrow;
  //charisma
  final int chaAtt;
  final bool chaSavingThrow;
  final Function swapChaSavingThrow;
  const SaveThrowContainerEditable({
    super.key,
    required this.profValue,
    //str
    required this.strAtt,
    required this.strSavingThrow,
    required this.swapStrSavingThrow,
    //dex
    required this.dexAtt,
    required this.dexSavingThrow,
    required this.swapDexSavingThrow,
    //con
    required this.conAtt,
    required this.conSavingThrow,
    required this.swapConSavingThrow,
    //int
    required this.intAtt,
    required this.intSavingThrow,
    required this.swapIntSavingThrow,
    //wis
    required this.wisAtt,
    required this.wisSavingThrow,
    required this.swapWisSavingThrow,
    //cha
    required this.chaAtt,
    required this.chaSavingThrow,
    required this.swapChaSavingThrow,
  });

  @override
  State<SaveThrowContainerEditable> createState() =>
      _SaveThrowContainerEditableState();
}

class _SaveThrowContainerEditableState
    extends State<SaveThrowContainerEditable> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/save_throw_background.svg',
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Strength',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '${formatAttributeToSaveCheck(widget.strAtt, widget.profValue, widget.strSavingThrow)}',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        Checkbox(
                          value: widget.strSavingThrow,
                          onChanged: (value) {
                            widget.swapStrSavingThrow(value);
                          },
                          activeColor: AppColors.black,
                          shape: const CircleBorder(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dexterity',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '${formatAttributeToSaveCheck(widget.dexAtt, widget.profValue, widget.dexSavingThrow)}',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        Checkbox(
                          value: widget.dexSavingThrow,
                          onChanged: (value) {
                            widget.swapDexSavingThrow(value);
                          },
                          activeColor: AppColors.black,
                          shape: const CircleBorder(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Constitution',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '${formatAttributeToSaveCheck(widget.conAtt, widget.profValue, widget.conSavingThrow)}',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        Checkbox(
                          value: widget.conSavingThrow,
                          onChanged: (value) {
                            widget.swapConSavingThrow(value);
                          },
                          activeColor: AppColors.black,
                          shape: const CircleBorder(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Intelligence',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '${formatAttributeToSaveCheck(widget.intAtt, widget.profValue, widget.intSavingThrow)}',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        Checkbox(
                          value: widget.intSavingThrow,
                          onChanged: (value) {
                            widget.swapIntSavingThrow(value);
                          },
                          activeColor: AppColors.black,
                          shape: const CircleBorder(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Wisdom',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '${formatAttributeToSaveCheck(widget.wisAtt, widget.profValue, widget.wisSavingThrow)}',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        Checkbox(
                          value: widget.wisSavingThrow,
                          onChanged: (value) {
                            widget.swapWisSavingThrow(value);
                          },
                          activeColor: AppColors.black,
                          shape: const CircleBorder(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Charisma',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '${formatAttributeToSaveCheck(widget.chaAtt, widget.profValue, widget.chaSavingThrow)}',
                          style:
                              DefaultTextTheme.titilliumWebRegular16(context)!
                                  .copyWith(color: AppColors.black),
                        ),
                        Checkbox(
                          value: widget.chaSavingThrow,
                          onChanged: (value) {
                            widget.swapChaSavingThrow(value);
                          },
                          activeColor: AppColors.black,
                          shape: const CircleBorder(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
