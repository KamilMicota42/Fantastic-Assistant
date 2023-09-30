import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../settings/injection.dart';
import '../../../../settings/routes/app_router.dart';
import '../../../../settings/routes/app_router.gr.dart';

@RoutePage()
class CreateNewCharacterScreen extends StatefulWidget {
  const CreateNewCharacterScreen({super.key});

  @override
  State<CreateNewCharacterScreen> createState() => _CreateNewCharacterScreen();
}

class _CreateNewCharacterScreen extends State<CreateNewCharacterScreen> {
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
            const Text(
              'Create new character screen',
            ),
            ElevatedButton(
              onPressed: () {},
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
