import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Character details:',
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('characters')
                  .doc(getIt<CurrentCharacterId>().state)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("Loading");
                }
                var userDocument = snapshot.data;
                return Column(
                  children: [
                    Text(userDocument!["character_name"]),
                    Text(userDocument["character_max_hp"].toString()),
                    Text(userDocument["character_curr_hp"].toString()),
                    Text(userDocument["account_id"]),
                  ],
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                getIt<AppRouter>().navigate(const CharactersRoute());
              },
              child: const Text(
                'Create a new character',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
