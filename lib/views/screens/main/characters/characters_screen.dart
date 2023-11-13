import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/models/characters/character.dart';
import 'package:fantastic_assistant/services/cubits/characters_related_cubits/current_character_id.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:fantastic_assistant/widgets/buttons/title_row.dart';
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
        isEqualTo: getIt<CurrentUserAdditionalData>().state?.accountId,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleRow(screenTitle: 'Characters'),
                StreamBuilder(
                  stream: _characters.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                            if (documentSnapshot['account_id'] ==
                                getIt<CurrentUserAdditionalData>()
                                    .state
                                    ?.accountId) {
                              return InkWell(
                                child: SizedBox(
                                  height: 100,
                                  child: Card(
                                    color: AppColors.lighterGrey,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: SizedBox(
                                              height: 100,
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(6),
                                                ),
                                                child: documentSnapshot[
                                                            'character_path_to_picture'] !=
                                                        null
                                                    ? Image.network(
                                                        documentSnapshot[
                                                            'character_path_to_picture'],
                                                        fit: BoxFit.fill,
                                                      )
                                                    : Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: AppColors
                                                              .lighterGrey,
                                                        ),
                                                        child: const FittedBox(
                                                          fit: BoxFit.fill,
                                                          child: Icon(
                                                            Icons.person_sharp,
                                                            color: AppColors
                                                                .darkerGrey,
                                                          ),
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            documentSnapshot['character_name'],
                                            textAlign: TextAlign.center,
                                            style: DefaultTextTheme
                                                    .titilliumWebBold20(
                                                        context)!
                                                .copyWith(
                                              color: AppColors.darkerGrey,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                documentSnapshot[
                                                    'character_level'],
                                                style: DefaultTextTheme
                                                    .titilliumWebRegular13(
                                                        context),
                                              ),
                                              Text(
                                                documentSnapshot[
                                                    'character_class'],
                                                style: DefaultTextTheme
                                                    .titilliumWebRegular13(
                                                        context),
                                              ),
                                              Text(
                                                documentSnapshot[
                                                    'character_race'],
                                                style: DefaultTextTheme
                                                    .titilliumWebRegular13(
                                                        context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  getIt<CurrentCharacter>().set(
                                    Character(
                                      accountId:
                                          documentSnapshot.get('account_id'),
                                      characterId: documentSnapshot.id,
                                      characterCurrHp: documentSnapshot
                                          .get('character_curr_hp'),
                                      characterMaxHp: documentSnapshot
                                          .get('character_max_hp'),
                                      characterName: documentSnapshot
                                          .get('character_name'),
                                    ),
                                  );
                                  getIt<AppRouter>()
                                      .navigate(const CharacterDetailsRoute());
                                },
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DefaultButton(
                    text: 'Create a new character',
                    height: 50,
                    function: () {
                      getIt<AppRouter>()
                          .navigate(const CreateCharacterFirstRoute());
                    },
                  ),
                ),
                const SizedBox(height: 125)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
