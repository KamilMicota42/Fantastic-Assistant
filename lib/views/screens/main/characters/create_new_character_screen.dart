import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _maxHpController = TextEditingController();
  final TextEditingController _currHpController = TextEditingController();
  final CollectionReference _characters =
      FirebaseFirestore.instance.collection('characters');

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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _currHpController,
                decoration: const InputDecoration(hintText: 'Curr hp'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _characters.add({
                  'account_id': getIt<FirebaseAuthCurrentUserUid>().state,
                  'character_name': _nameController.text,
                  'character_max_hp': _maxHpController.text,
                  'character_curr_hp': _currHpController.text,
                });
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
