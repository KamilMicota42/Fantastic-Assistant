import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../../services/api/characters/create_character.dart';
import '../../../../settings/injection.dart';
import '../../../../settings/routes/app_router.dart';
import '../../../../settings/routes/app_router.gr.dart';
import '../../../../utils/methods/data_validation.dart';

@RoutePage()
class CreateCharacterScreen extends StatefulWidget {
  const CreateCharacterScreen({super.key});

  @override
  State<CreateCharacterScreen> createState() => _CreateCharacterScreen();
}

class _CreateCharacterScreen extends State<CreateCharacterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _maxHpController = TextEditingController();
  final TextEditingController _currHpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                getIt<AppRouter>().navigate(const CharactersRoute());
              },
              child: const Text(
                'Go back',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                  controller: _maxHpController,
                  decoration: const InputDecoration(hintText: 'Max hp'),
                  keyboardType: TextInputType.number),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                  controller: _currHpController,
                  decoration: const InputDecoration(hintText: 'Curr hp'),
                  keyboardType: TextInputType.number),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    isIntable(_maxHpController.text) &&
                    isIntable(_currHpController.text)) {
                  createCharacter(
                    context,
                    _nameController.text,
                    _maxHpController.text,
                    _currHpController.text,
                  );
                } else {
                  showSnackBar(context, 'Values are not correct');
                }
              },
              child: const Text(
                'Create',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
