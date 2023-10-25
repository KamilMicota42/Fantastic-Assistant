import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/api/characters/characters_api.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../../services/cubits/characters_related_cubits/current_character_id.dart';
import '../../../../settings/injection.dart';
import '../../../../settings/routes/app_router.dart';
import '../../../../utils/methods/data_validation.dart';

@RoutePage()
class EditCharacterScreen extends StatefulWidget {
  const EditCharacterScreen({super.key});

  @override
  State<EditCharacterScreen> createState() => _EditCharacterScreenState();
}

class _EditCharacterScreenState extends State<EditCharacterScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: getIt<CurrentCharacter>().state?.characterName,
  );
  final TextEditingController _maxHpController = TextEditingController(
    text: getIt<CurrentCharacter>().state?.characterMaxHp.toString(),
  );
  final TextEditingController _currHpController = TextEditingController(
    text: getIt<CurrentCharacter>().state?.characterCurrHp.toString(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                getIt<AppRouter>().pop();
              },
              child: const Text(
                'Go back',
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText:
                          '${getIt<CurrentCharacter>().state?.characterName} - character name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _maxHpController,
                    decoration: InputDecoration(
                      hintText:
                          '${getIt<CurrentCharacter>().state?.characterMaxHp} - character max hp',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _currHpController,
                    decoration: InputDecoration(
                      hintText:
                          '${getIt<CurrentCharacter>().state?.characterCurrHp} - character curr hp',
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    isIntable(_maxHpController.text) &&
                    isIntable(_currHpController.text)) {
                  if (_nameController.text ==
                          getIt<CurrentCharacter>().state?.characterName &&
                      _maxHpController.text ==
                          getIt<CurrentCharacter>()
                              .state
                              ?.characterMaxHp
                              .toString() &&
                      _currHpController.text ==
                          getIt<CurrentCharacter>()
                              .state
                              ?.characterCurrHp
                              .toString()) {
                    showSnackBar('Values must be diffrient from originals');
                  } else {
                    editCharacter(
                      context,
                      _nameController.text,
                      _maxHpController.text,
                      _currHpController.text,
                    );
                  }
                } else {
                  showSnackBar('Values are not correct');
                }
              },
              child: const Text(
                'Edit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
