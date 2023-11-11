import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/utils/methods/data_validation.dart';
import 'package:fantastic_assistant/utils/methods/dnd_rules.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/custom_dropdown_menu.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/go_back_title_row.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CreateCharacterScreen extends StatefulWidget {
  const CreateCharacterScreen({super.key});

  @override
  State<CreateCharacterScreen> createState() => _CreateCharacterScreenState();
}

class _CreateCharacterScreenState extends State<CreateCharacterScreen> {
  // Basic section
  String? _imageUrl;
  final TextEditingController _nameController = TextEditingController();
  String? _classController;
  String? _raceController;
  final TextEditingController _maxHpController = TextEditingController();
  final TextEditingController _currHpController = TextEditingController();

  final TextEditingController _speedController = TextEditingController();
  final TextEditingController _initiativeController = TextEditingController();
  final TextEditingController _armorClassController = TextEditingController();
  final TextEditingController _defaultProfController = TextEditingController();

  final TextEditingController _strengthController = TextEditingController();
  final TextEditingController _dexterityController = TextEditingController();
  final TextEditingController _constitutionController = TextEditingController();
  final TextEditingController _intelligenceController = TextEditingController();
  final TextEditingController _wisdomController = TextEditingController();
  final TextEditingController _charismaController = TextEditingController();

  // Item section
  // final TextEditingController _copperController = TextEditingController();
  // final TextEditingController _silverController = TextEditingController();
  // final TextEditingController _electrumController = TextEditingController();
  // final TextEditingController _goldController = TextEditingController();
  // final TextEditingController _platinumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const GoBackTitleRow(screenTitle: 'Create Character'),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                      ),
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        if (file == null) return;

                        Reference referenceRoot =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirImages =
                            referenceRoot.child('charactersImages');

                        String currentVarForFutureCharacterId =
                            DateTime.now().millisecondsSinceEpoch.toString();

                        Reference referenceImageToUpload = referenceDirImages
                            .child(currentVarForFutureCharacterId);

                        try {
                          await referenceImageToUpload.putFile(File(file.path));
                          _imageUrl =
                              await referenceImageToUpload.getDownloadURL();
                        } catch (e) {
                          context.mounted ? showSnackBar(e.toString()) : null;
                        }
                      },
                    ),
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  CustomDropdownMenu(
                    listItem: const [
                      'Not specified',
                      'Barbarian',
                      'Bard',
                      'Cleric',
                      'Druid',
                      'Fighter',
                      'Monk',
                      'Paladin',
                      'Ranger',
                      'Rogue',
                      'Sorceror',
                      'Warlock',
                      'Wizard',
                    ],
                    onChanged: (value) {
                      _classController = value;
                    },
                  ),
                  CustomDropdownMenu(
                    listItem: const [
                      'Not specified',
                      'Dragonborn',
                      'Dwarf',
                      'Elf',
                      'Gnome',
                      'Half Elf',
                      'Halfling',
                      'Half Orc',
                      'Human',
                      'Human'
                    ],
                    onChanged: (value) {
                      _raceController = value;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _maxHpController,
                          decoration: const InputDecoration(hintText: 'Max hp'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _currHpController,
                          decoration:
                              const InputDecoration(hintText: 'Curr hp'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _speedController,
                          decoration: const InputDecoration(hintText: 'Speed'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _initiativeController,
                          decoration:
                              const InputDecoration(hintText: 'Initiative'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _armorClassController,
                          decoration:
                              const InputDecoration(hintText: 'Armor class'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _defaultProfController,
                          decoration:
                              const InputDecoration(hintText: 'Default prof'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 200,
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple,
                              ),
                              child: Center(
                                child:
                                    Text(_strengthController.text.isNotEmpty &&
                                            isIntable(
                                              _strengthController.text,
                                            )
                                        ? attributeToModifier(
                                            int.parse(
                                              _strengthController.text,
                                            ),
                                          ).toString()
                                        : '0'),
                              ),
                            ),
                            TextField(
                              controller: _strengthController,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration:
                                  const InputDecoration(hintText: 'Strength'),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _dexterityController,
                          decoration:
                              const InputDecoration(hintText: 'Dexterity'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _constitutionController,
                          decoration:
                              const InputDecoration(hintText: 'Constitution'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _intelligenceController,
                          decoration:
                              const InputDecoration(hintText: 'Intelligence'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _wisdomController,
                          decoration: const InputDecoration(hintText: 'Wisdom'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 60,
                        child: TextField(
                          controller: _charismaController,
                          decoration:
                              const InputDecoration(hintText: 'Charisma'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //ADD VALIDATION
                      debugPrint(_imageUrl);
                      debugPrint(_nameController.text);
                      debugPrint(_classController);
                      debugPrint(_raceController);
                      // if (_nameController.text.isNotEmpty &&
                      //     isIntable(_maxHpController.text) &&
                      //     isIntable(_currHpController.text)) {
                      //   createCharacter(
                      //     context,
                      //     _nameController.text,
                      //     _maxHpController.text,
                      //     _currHpController.text,
                      //   );
                      // } else {
                      //   showSnackBar(context, 'Values are not correct');
                      // }
                    },
                    child: const Text(
                      'Create',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     Expanded(
//       child: TextField(
//         controller: _copperController,
//         decoration: const InputDecoration(hintText: 'Copper'),
//         keyboardType: TextInputType.number,
//       ),
//     ),
//     Expanded(
//       child: TextField(
//         controller: _silverController,
//         decoration: const InputDecoration(hintText: 'Silver'),
//         keyboardType: TextInputType.number,
//       ),
//     ),
//     Expanded(
//       child: TextField(
//         controller: _electrumController,
//         decoration: const InputDecoration(hintText: 'Electrum'),
//         keyboardType: TextInputType.number,
//       ),
//     ),
//     Expanded(
//       child: TextField(
//         controller: _goldController,
//         decoration: const InputDecoration(hintText: 'Gold'),
//         keyboardType: TextInputType.number,
//       ),
//     ),
//     Expanded(
//       child: TextField(
//         controller: _platinumController,
//         decoration: const InputDecoration(hintText: 'Platinum'),
//         keyboardType: TextInputType.number,
//       ),
//     ),
//   ],
// ),

// final Map<String, int?> _currenciesController = {
//   'Copper': int.parse(_copperController.text),
//   'Silver': int.parse(_silverController.text),
//   'Electrum': int.parse(_electrumController.text),
//   'Gold': int.parse(_goldController.text),
//   'Platinum': int.parse(_platinumController.text)
// };
// print(_currenciesController);
