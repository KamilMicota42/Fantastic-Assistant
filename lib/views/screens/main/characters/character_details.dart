import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/cubits/characters_related_cubits/current_character_id.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../../../../settings/injection.dart';

@RoutePage()
class CharacterDetailsScreen extends StatefulWidget {
  const CharacterDetailsScreen({super.key});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
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
            const Text(
              'Character details:',
            ),
            Text(
              getIt<CurrentCharacter>().state.toString(),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                getIt<AppRouter>().navigate(const EditCharacterRoute());
              },
              child: const Text(
                'Edit character',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
