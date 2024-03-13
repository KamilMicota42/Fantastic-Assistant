import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/models/characters/character_model/character_model.dart';
import 'package:fantastic_assistant/services/api/characters/characters_api.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character.dart';
import 'package:fantastic_assistant/views/screens/main/characters/editCharacter/widgets/save_throw_container_editable.dart';
import 'package:fantastic_assistant/views/screens/main/characters/editCharacter/widgets/textfield_and_description.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/curr_hp_max_hp_text_field.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/go_back_title_row.dart';
import 'package:fantastic_assistant/widgets/containers/att_and_mod_editable.dart';
import 'package:fantastic_assistant/widgets/input/default_text_field_w_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/injection.dart';
import '../../../../../settings/routes/app_router.dart';
import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/const/character_class_list.dart';
import '../../../../../utils/const/character_levels_list.dart';
import '../../../../../utils/const/character_races_list.dart';
import '../../../../../utils/dnd_rules/dnd_rules.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../widgets/buttons/add_photo_icon_button.dart';
import '../../../../../widgets/texts/describer_of_textfield.dart';
import '../cubits/current_character_id.dart';
import '../widgets/custom_dropdown_menu.dart';
import '../widgets/prof_controller_row.dart';
import 'widgets/notes_editable_tab.dart';

@RoutePage()
class EditCharacterScreen extends StatefulWidget {
  const EditCharacterScreen({super.key});

  @override
  State<EditCharacterScreen> createState() => _EditCharacterScreenState();
}

class _EditCharacterScreenState extends State<EditCharacterScreen> {
  //photo
  String? initialImageUrl;
  File? pictureValue;
  bool pictureChanged = false;
  TextEditingController characterNameController = TextEditingController();
  //Basic Info
  String levelStringValue = InGameLevels.characterLevelsList.first;
  int levelIntValue = 1;
  String classValue = InGameClasses.characterClassesList.first;
  String raceValue = InGameRaces.characterRacesList.first;
  TextEditingController currHpController = TextEditingController();
  TextEditingController maxHpController = TextEditingController();
  TextEditingController profBonusController = TextEditingController();
  TextEditingController walkingSpeedController = TextEditingController();
  TextEditingController initiativeController = TextEditingController();
  TextEditingController armorClassController = TextEditingController();
  //Attributes
  TextEditingController strAttController = TextEditingController();
  TextEditingController dexAttController = TextEditingController();
  TextEditingController conAttController = TextEditingController();
  TextEditingController intAttController = TextEditingController();
  TextEditingController wisAttController = TextEditingController();
  TextEditingController chaAttController = TextEditingController();
  //Saving throw
  bool strSavingThrowProf = false;
  bool dexSavingThrowProf = false;
  bool conSavingThrowProf = false;
  bool intSavingThrowProf = false;
  bool wisSavingThrowProf = false;
  bool chaSavingThrowProf = false;

  //Skills
  bool athleticsProfController = false;
  bool acrobaticsProfController = false;
  bool sleightOfHandsProfController = false;
  bool stealthProfController = false;
  bool arcanaProfController = false;
  bool historyProfController = false;
  bool investigationProfController = false;
  bool natureProfController = false;
  bool religionProfController = false;
  bool animalHandlingProfController = false;
  bool insightProfController = false;
  bool medicineProfController = false;
  bool perceptionProfController = false;
  bool survivalProfController = false;
  bool deceptionProfController = false;
  bool intimidationProfController = false;
  bool performanceProfController = false;
  bool persuasionProfController = false;

  //Notes
  List<TextEditingController> notesControllers = [];
  int notesIndex = 0;
  List<dynamic> notesValues = [];

  @override
  void initState() {
    initialImageUrl =
        getIt<CurrentCharacterCubit>().state?.characterPathToPicture != null ? getIt<CurrentCharacterCubit>().state!.characterPathToPicture : null;
    //Basic Info
    characterNameController.text =
        getIt<CurrentCharacterCubit>().state?.characterName != null ? getIt<CurrentCharacterCubit>().state!.characterName! : '';
    if (getIt<CurrentCharacterCubit>().state?.characterLevel != null) {
      levelStringValue = "Level ${getIt<CurrentCharacterCubit>().state?.characterLevel}";
    }
    if (getIt<CurrentCharacterCubit>().state?.characterLevel != null) {
      levelIntValue = getIt<CurrentCharacterCubit>().state!.characterLevel!;
    }
    if (getIt<CurrentCharacterCubit>().state?.characterClass != null) {
      classValue = getIt<CurrentCharacterCubit>().state!.characterClass.toString();
    }
    if (getIt<CurrentCharacterCubit>().state?.characterRace != null) {
      raceValue = getIt<CurrentCharacterCubit>().state!.characterRace.toString();
    }
    currHpController.text = getIt<CurrentCharacterCubit>().state?.characterBasicInfo?.currentHp.toString() ?? '0';
    maxHpController.text = getIt<CurrentCharacterCubit>().state?.characterBasicInfo?.maxHp.toString() ?? '0';
    profBonusController.text = getIt<CurrentCharacterCubit>().state?.characterBasicInfo?.proficiency != null
        ? getIt<CurrentCharacterCubit>().state!.characterBasicInfo!.proficiency.toString()
        : '2';
    walkingSpeedController.text = getIt<CurrentCharacterCubit>().state?.characterBasicInfo?.speed != null
        ? getIt<CurrentCharacterCubit>().state!.characterBasicInfo!.speed.toString()
        : '30';
    initiativeController.text = getIt<CurrentCharacterCubit>().state?.characterBasicInfo?.initiative != null
        ? getIt<CurrentCharacterCubit>().state!.characterBasicInfo!.initiative.toString()
        : '0';
    armorClassController.text = getIt<CurrentCharacterCubit>().state?.characterBasicInfo?.armorClass != null
        ? getIt<CurrentCharacterCubit>().state!.characterBasicInfo!.armorClass.toString()
        : '10';
    //Attributes
    strAttController.text = getIt<CurrentCharacterCubit>().state?.characterAttributes?.strength != null
        ? getIt<CurrentCharacterCubit>().state!.characterAttributes!.strength.toString()
        : '10';
    dexAttController.text = getIt<CurrentCharacterCubit>().state?.characterAttributes?.dexterity != null
        ? getIt<CurrentCharacterCubit>().state!.characterAttributes!.dexterity.toString()
        : '10';
    conAttController.text = getIt<CurrentCharacterCubit>().state?.characterAttributes?.constitution != null
        ? getIt<CurrentCharacterCubit>().state!.characterAttributes!.constitution.toString()
        : '10';
    intAttController.text = getIt<CurrentCharacterCubit>().state?.characterAttributes?.intelligence != null
        ? getIt<CurrentCharacterCubit>().state!.characterAttributes!.intelligence.toString()
        : '10';
    wisAttController.text = getIt<CurrentCharacterCubit>().state?.characterAttributes?.wisdom != null
        ? getIt<CurrentCharacterCubit>().state!.characterAttributes!.wisdom.toString()
        : '10';
    chaAttController.text = getIt<CurrentCharacterCubit>().state?.characterAttributes?.charisma != null
        ? getIt<CurrentCharacterCubit>().state!.characterAttributes!.charisma.toString()
        : '10';

    //Saving throw
    strSavingThrowProf = getIt<CurrentCharacterCubit>().state?.characterProfSaveChecks?.saveStrength != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSaveChecks!.saveStrength!
        : false;
    dexSavingThrowProf = getIt<CurrentCharacterCubit>().state?.characterProfSaveChecks?.saveDexterity != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSaveChecks!.saveDexterity!
        : false;
    conSavingThrowProf = getIt<CurrentCharacterCubit>().state?.characterProfSaveChecks?.saveConstitution != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSaveChecks!.saveConstitution!
        : false;
    intSavingThrowProf = getIt<CurrentCharacterCubit>().state?.characterProfSaveChecks?.saveIntelligence != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSaveChecks!.saveIntelligence!
        : false;
    wisSavingThrowProf = getIt<CurrentCharacterCubit>().state?.characterProfSaveChecks?.saveWisdom != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSaveChecks!.saveWisdom!
        : false;
    chaSavingThrowProf = getIt<CurrentCharacterCubit>().state?.characterProfSaveChecks?.saveCharisma != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSaveChecks!.saveCharisma!
        : false;

    athleticsProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.athletics != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.athletics!
        : false;
    acrobaticsProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.acrobatics != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.acrobatics!
        : false;
    sleightOfHandsProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.sleightOfHand != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.sleightOfHand!
        : false;
    stealthProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.stealth != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.stealth!
        : false;
    arcanaProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.arcana != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.arcana!
        : false;
    historyProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.history != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.history!
        : false;
    investigationProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.investigation != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.investigation!
        : false;
    natureProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.nature != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.nature!
        : false;
    religionProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.religion != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.religion!
        : false;
    animalHandlingProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.animalHandling != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.animalHandling!
        : false;
    insightProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.insight != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.insight!
        : false;
    medicineProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.medicine != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.medicine!
        : false;
    perceptionProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.perception != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.perception!
        : false;
    survivalProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.survival != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.survival!
        : false;
    deceptionProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.deception != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.deception!
        : false;
    intimidationProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.intimidation != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.intimidation!
        : false;
    performanceProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.performance != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.performance!
        : false;
    persuasionProfController = getIt<CurrentCharacterCubit>().state?.characterProfSkills?.persuasion != null
        ? getIt<CurrentCharacterCubit>().state!.characterProfSkills!.persuasion!
        : false;

    //Notes
    if (getIt<CurrentCharacterCubit>().state?.characterNotes != null) {
      for (var i = 0; i < getIt<CurrentCharacterCubit>().state!.characterNotes!.length; i++) {
        notesControllers.add(TextEditingController(text: getIt<CurrentCharacterCubit>().state!.characterNotes![i]));
      }
    }

    super.initState();
  }

  int mainIndex = 0;
  List<String> mainTabs = ['Basic Info', 'Attrbutes', 'Saving Throw', 'Skills', 'Notes'];

  @override
  void dispose() {
    characterNameController.dispose();
    currHpController.dispose();
    maxHpController.dispose();
    profBonusController.dispose();
    walkingSpeedController.dispose();
    initiativeController.dispose();
    armorClassController.dispose();
    strAttController.dispose();
    dexAttController.dispose();
    conAttController.dispose();
    intAttController.dispose();
    wisAttController.dispose();
    chaAttController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: BlocBuilder<CurrentCharacterCubit, CharacterModel?>(
              bloc: getIt<CurrentCharacterCubit>(),
              builder: (context, state) {
                return Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GoBackTitleRow(
                            screenTitle: "Edit character",
                            popFunction: () {
                              getIt<AppRouter>().maybePop();
                            },
                            rightSideWidget: IconButton(
                              onPressed: () {
                                notesValues = [];
                                for (TextEditingController controller in notesControllers) {
                                  notesValues.add(controller.text);
                                }
                                if (getIt<CurrentCharacterId>().state != null) {
                                  //edit
                                  getIt<CharactersApi>().updateCharacter(
                                    getIt<CurrentCharacterId>().state.toString(),
                                    pictureValue,
                                    pictureChanged,
                                    characterNameController.text,
                                    levelIntValue,
                                    classValue,
                                    raceValue,
                                    {
                                      'proficiency': int.parse(profBonusController.text),
                                      'armor_class': int.parse(armorClassController.text),
                                      'initiative': int.parse(initiativeController.text),
                                      'speed': int.parse(walkingSpeedController.text),
                                      'current_hp': int.parse(currHpController.text),
                                      'max_hp': int.parse(maxHpController.text),
                                    },
                                    {
                                      'strength': int.parse(strAttController.text),
                                      'dexterity': int.parse(dexAttController.text),
                                      'constitution': int.parse(conAttController.text),
                                      'intelligence': int.parse(intAttController.text),
                                      'wisdom': int.parse(wisAttController.text),
                                      'charisma': int.parse(chaAttController.text),
                                    },
                                    {
                                      "save_charisma": chaSavingThrowProf,
                                      "save_constitution": conSavingThrowProf,
                                      "save_dexterity": dexSavingThrowProf,
                                      "save_intelligence": intSavingThrowProf,
                                      "save_strength": strSavingThrowProf,
                                      "save_wisdom": wisSavingThrowProf
                                    },
                                    {
                                      "acrobatics": acrobaticsProfController,
                                      "animal_handling": animalHandlingProfController,
                                      "arcana": arcanaProfController,
                                      "athletics": athleticsProfController,
                                      "deception": deceptionProfController,
                                      "history": historyProfController,
                                      "insight": insightProfController,
                                      "intimidation": intimidationProfController,
                                      "investigation": investigationProfController,
                                      "medicine": medicineProfController,
                                      "nature": natureProfController,
                                      "perception": perceptionProfController,
                                      "performance": performanceProfController,
                                      "persuasion": persuasionProfController,
                                      "religion": religionProfController,
                                      "sleight_of_hand": sleightOfHandsProfController,
                                      "stealth": stealthProfController,
                                      "survival": survivalProfController
                                    },
                                    notesValues,
                                  );
                                } else {
                                  //save
                                  getIt<CharactersApi>().createCharacter(
                                    pictureValue,
                                    pictureChanged,
                                    characterNameController.text,
                                    levelIntValue,
                                    classValue,
                                    raceValue,
                                    {
                                      'proficiency': int.parse(profBonusController.text),
                                      'armor_class': int.parse(armorClassController.text),
                                      'initiative': int.parse(initiativeController.text),
                                      'speed': int.parse(walkingSpeedController.text),
                                      'current_hp': int.parse(currHpController.text),
                                      'max_hp': int.parse(maxHpController.text),
                                    },
                                    {
                                      'strength': int.parse(strAttController.text),
                                      'dexterity': int.parse(dexAttController.text),
                                      'constitution': int.parse(conAttController.text),
                                      'intelligence': int.parse(intAttController.text),
                                      'wisdom': int.parse(wisAttController.text),
                                      'charisma': int.parse(chaAttController.text),
                                    },
                                    {
                                      "save_charisma": chaSavingThrowProf,
                                      "save_constitution": conSavingThrowProf,
                                      "save_dexterity": dexSavingThrowProf,
                                      "save_intelligence": intSavingThrowProf,
                                      "save_strength": strSavingThrowProf,
                                      "save_wisdom": wisSavingThrowProf
                                    },
                                    {
                                      "acrobatics": acrobaticsProfController,
                                      "animal_handling": animalHandlingProfController,
                                      "arcana": arcanaProfController,
                                      "athletics": athleticsProfController,
                                      "deception": deceptionProfController,
                                      "history": historyProfController,
                                      "insight": insightProfController,
                                      "intimidation": intimidationProfController,
                                      "investigation": investigationProfController,
                                      "medicine": medicineProfController,
                                      "nature": natureProfController,
                                      "perception": perceptionProfController,
                                      "performance": performanceProfController,
                                      "persuasion": persuasionProfController,
                                      "religion": religionProfController,
                                      "sleight_of_hand": sleightOfHandsProfController,
                                      "stealth": stealthProfController,
                                      "survival": survivalProfController
                                    },
                                    notesValues,
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.save_sharp,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 120),
                              SizedBox(
                                height: MediaQuery.of(context).size.width - 100,
                                width: MediaQuery.of(context).size.width - 100,
                                child: AddPhotoIconButton(
                                    initialImageUrl: initialImageUrl,
                                    onTapFunction: (var value) {
                                      pictureValue = value;
                                    },
                                    onChange: () {
                                      pictureChanged = true;
                                    }),
                              ),
                              const SizedBox(height: 6),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: DefaultTextFieldWLabel(
                                  textController: characterNameController,
                                  labelColor: AppColors.white,
                                  labelText: 'Character name',
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 40,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: mainTabs.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(right: 20),
                                            child: SizedBox(
                                              child: TextButton(
                                                onPressed: () {
                                                  mainIndex = index;
                                                  setState(() {});
                                                },
                                                style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                                                child: Text(
                                                  mainTabs[index],
                                                  style: mainIndex == index
                                                      ? DefaultTextTheme.titilliumWebBold16(context)!.copyWith(
                                                          overflow: TextOverflow.ellipsis,
                                                          color: AppColors.greenNeon,
                                                        )
                                                      : DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(
                                                          overflow: TextOverflow.ellipsis,
                                                          color: AppColors.greenWhite,
                                                        ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // BASIC INFO
                              mainIndex == 0
                                  ? Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        const DescriberOfTextField(
                                          title: 'Level',
                                          icon: Icons.arrow_upward_sharp,
                                        ),
                                        CustomDropdownMenu(
                                          listItem: InGameLevels.characterLevelsList,
                                          onChanged: (value) {
                                            levelStringValue = value;
                                            levelIntValue = InGameLevels.levelReturnIntFromString(value);
                                            profBonusController.text =
                                                DndRules.levelAndProficiencyMap[InGameLevels.levelReturnIntFromString(value)].toString();
                                            setState(() {});
                                          },
                                          initialValue: levelStringValue,
                                        ),
                                        const SizedBox(height: 20),
                                        const DescriberOfTextField(
                                          title: 'Class',
                                          icon: Icons.boy_sharp,
                                        ),
                                        CustomDropdownMenu(
                                          listItem: InGameClasses.characterClassesList,
                                          onChanged: (value) {
                                            classValue = value;
                                          },
                                          initialValue: classValue,
                                        ),
                                        const SizedBox(height: 20),
                                        const DescriberOfTextField(
                                          title: 'Race',
                                          icon: Icons.group_sharp,
                                        ),
                                        CustomDropdownMenu(
                                          listItem: InGameRaces.characterRacesList,
                                          onChanged: (value) {
                                            raceValue = value;
                                          },
                                          initialValue: raceValue,
                                        ),
                                        const SizedBox(height: 20),
                                        CurrHpMaxHpTextField(
                                          currentHpController: currHpController,
                                          maxHpController: maxHpController,
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextfieldAndDescription(
                                              controller: profBonusController,
                                              description: 'Prof. Bonus',
                                              descriptionColor: AppColors.white,
                                              defValueIfNotCorrect: DndRules.levelAndProficiencyMap[levelIntValue].toString(),
                                              hintText: DndRules.hintsList["proficiency"],
                                            ),
                                            TextfieldAndDescription(
                                              controller: walkingSpeedController,
                                              description: 'Wlk. Speed',
                                              descriptionColor: AppColors.white,
                                              defValueIfNotCorrect: '30',
                                              hintText: DndRules.hintsList["speed"],
                                            ),
                                            TextfieldAndDescription(
                                              controller: initiativeController,
                                              description: 'Initiative',
                                              descriptionColor: AppColors.white,
                                              defValueIfNotCorrect: DndRules.attributeToModifier(int.parse(dexAttController.text)).toString(),
                                              hintText: DndRules.hintsList["initiative"],
                                            ),
                                            TextfieldAndDescription(
                                              controller: armorClassController,
                                              description: 'Armor Class',
                                              descriptionColor: AppColors.white,
                                              defValueIfNotCorrect:
                                                  '${10 + int.parse(DndRules.attributeToModifier(int.parse(dexAttController.text)).toString())}',
                                              hintText: DndRules.hintsList["armorClass"],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              mainIndex == 1
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            AttAndModEditable(
                                              attributeName: 'Strength',
                                              controller: strAttController,
                                            ),
                                            Focus(
                                              onFocusChange: (hasFocus) {
                                                initiativeController.text = DndRules.attributeToModifier(int.parse(dexAttController.text)).toString();
                                                armorClassController.text =
                                                    '${10 + int.parse(DndRules.attributeToModifier(int.parse(dexAttController.text)).toString())}';
                                                setState(() {});
                                              },
                                              child: AttAndModEditable(
                                                attributeName: 'Dexterity',
                                                controller: dexAttController,
                                              ),
                                            ),
                                            AttAndModEditable(
                                              attributeName: 'Constitution',
                                              controller: conAttController,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            AttAndModEditable(
                                              attributeName: 'Intelligence',
                                              controller: intAttController,
                                            ),
                                            AttAndModEditable(
                                              attributeName: 'Wisdom',
                                              controller: wisAttController,
                                            ),
                                            AttAndModEditable(
                                              attributeName: 'Charisma',
                                              controller: chaAttController,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              mainIndex == 2
                                  ? SaveThrowContainerEditable(
                                      profValue: int.parse(profBonusController.text),
                                      strAtt: int.parse(strAttController.text),
                                      strSavingThrow: strSavingThrowProf,
                                      swapStrSavingThrow: (value) {
                                        strSavingThrowProf = value;
                                        setState(() {});
                                      },
                                      dexAtt: int.parse(dexAttController.text),
                                      dexSavingThrow: dexSavingThrowProf,
                                      swapDexSavingThrow: (value) {
                                        dexSavingThrowProf = value;
                                        setState(() {});
                                      },
                                      conAtt: int.parse(conAttController.text),
                                      conSavingThrow: conSavingThrowProf,
                                      swapConSavingThrow: (value) {
                                        conSavingThrowProf = value;
                                        setState(() {});
                                      },
                                      intAtt: int.parse(intAttController.text),
                                      intSavingThrow: intSavingThrowProf,
                                      swapIntSavingThrow: (value) {
                                        intSavingThrowProf = value;
                                        setState(() {});
                                      },
                                      wisAtt: int.parse(wisAttController.text),
                                      wisSavingThrow: wisSavingThrowProf,
                                      swapWisSavingThrow: (value) {
                                        wisSavingThrowProf = value;
                                        setState(() {});
                                      },
                                      chaAtt: int.parse(chaAttController.text),
                                      chaSavingThrow: chaSavingThrowProf,
                                      swapChaSavingThrow: (value) {
                                        chaSavingThrowProf = value;
                                        setState(() {});
                                      },
                                    )
                                  : const SizedBox(),
                              mainIndex == 3
                                  ? Column(
                                      children: [
                                        ProfControllerRow(
                                          skillName: 'Athletics',
                                          profController: athleticsProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(strAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            athleticsProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Acrobatics',
                                          profController: acrobaticsProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(dexAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            acrobaticsProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Sleight of hands',
                                          profController: sleightOfHandsProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(dexAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            sleightOfHandsProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Stealth',
                                          profController: stealthProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(dexAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            stealthProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Arcana',
                                          profController: arcanaProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(intAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            arcanaProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'History',
                                          profController: historyProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(intAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            historyProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Investigation',
                                          profController: investigationProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(intAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            investigationProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Nature',
                                          profController: natureProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(intAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            natureProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Religion',
                                          profController: religionProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(intAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            religionProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Animal handling',
                                          profController: animalHandlingProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(wisAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            animalHandlingProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Insight',
                                          profController: insightProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(wisAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            insightProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Medicine',
                                          profController: medicineProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(wisAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            medicineProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Perception',
                                          profController: perceptionProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(wisAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            perceptionProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Survival',
                                          profController: survivalProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(wisAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            survivalProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Deception',
                                          profController: deceptionProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(chaAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            deceptionProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Intimidation',
                                          profController: intimidationProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(chaAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            intimidationProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Performance',
                                          profController: performanceProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(chaAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            performanceProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                        ProfControllerRow(
                                          skillName: 'Persuasion',
                                          profController: persuasionProfController,
                                          skillMod: DndRules.attributeToModifier(int.parse(chaAttController.text)),
                                          profMod: int.parse(profBonusController.text),
                                          handleControllerChange: (value) {
                                            persuasionProfController = value;
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              mainIndex == 4
                                  ? NotesEditableTab(
                                      notesControllers: notesControllers,
                                      notesIndex: notesIndex,
                                      changeNotesIndex: (index) {
                                        notesIndex = index;
                                        setState(() {});
                                      },
                                      removeNote: () {
                                        if (notesControllers.isNotEmpty) {
                                          notesControllers.removeAt(notesIndex);
                                          notesIndex = 0;
                                          setState(() {});
                                        }
                                      },
                                      addNote: () {
                                        if (notesControllers.length < 20) {
                                          notesControllers.add(TextEditingController(text: 'Note ${notesControllers.length + 1}'));
                                          notesIndex = notesControllers.length - 1;
                                          setState(() {});
                                        } else {
                                          showSnackBar("Each character can have only 20 notes");
                                        }
                                      },
                                    )
                                  : const SizedBox(),
                              const SizedBox(height: 120),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
