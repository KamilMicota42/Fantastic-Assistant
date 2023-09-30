import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:flutter/material.dart';

import '../../../../settings/injection.dart';
import '../../../../settings/routes/app_router.dart';
import '../../../../settings/routes/app_router.gr.dart';

@RoutePage()
class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final _characters = FirebaseFirestore.instance.collection('characters').where(
      'account_id',
      isEqualTo: getIt<FirebaseAuthCurrentUserUid>().state);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Characters screen',
              ),
            ),
            StreamBuilder(
                stream: _characters.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          if (documentSnapshot['account_id'] ==
                              getIt<FirebaseAuthCurrentUserUid>().state) {
                            return InkWell(
                              child: Card(
                                margin: const EdgeInsets.all(10),
                                child: ListTile(
                                  title: Text(
                                    documentSnapshot['character_name'],
                                  ),
                                  subtitle: Text(
                                    documentSnapshot.id,
                                  ),
                                ),
                              ),
                              onTap: () {},
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                }),
            ElevatedButton(
              onPressed: () {
                getIt<AppRouter>().navigate(const CreateCharacterRoute());
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
