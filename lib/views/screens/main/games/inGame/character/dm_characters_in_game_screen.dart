import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:fantastic_assistant/views/screens/inital_loading/cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/character_picture.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:flutter/material.dart';

import '../../../../../../services/api/characters/characters_api.dart';
import '../../../../../../settings/injection.dart';
import '../../../../../../settings/routes/app_router.dart';
import '../../../../../../settings/routes/app_router.gr.dart';
import '../../../../../../utils/methods/show_snack_bar.dart';
import '../../../../../../widgets/buttons/go_back_title_row.dart';
import '../../cubits/current_game_id.dart';

@RoutePage()
class DmCharactersScreen extends StatefulWidget {
  const DmCharactersScreen({super.key});

  @override
  State<DmCharactersScreen> createState() => _DmCharactersScreenState();
}

class _DmCharactersScreenState extends State<DmCharactersScreen> {
  var game = FirebaseFirestore.instance.collection('games').doc(getIt<CurrentGameId>().state).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<Object>(
                  stream: game,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      Stream<QuerySnapshot<Object?>>? characters;
                      if (snapshot.data?['characters_id'].isNotEmpty) {
                        characters = FirebaseFirestore.instance
                            .collection('characters')
                            .where(
                              FieldPath.documentId,
                              whereIn: snapshot.data?['characters_id'],
                            )
                            .snapshots();
                      }
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: GoBackTitleRow(
                                screenTitle: "CHARACTERS",
                                isX: true,
                                popFunction: () {
                                  getIt<AppRouter>().maybePop();
                                },
                              ),
                            ),
                            (snapshot.data?['characters_id'].isNotEmpty)
                                ? StreamBuilder(
                                    stream: characters,
                                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshotCharacters) {
                                      if (streamSnapshotCharacters.hasData) {
                                        if (streamSnapshotCharacters.data!.docs.isNotEmpty) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: ListView.builder(
                                              itemCount: streamSnapshotCharacters.data!.docs.length,
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                final DocumentSnapshot documentSnapshotCharacters = streamSnapshotCharacters.data!.docs[index];
                                                return InkWell(
                                                  child: SizedBox(
                                                    height: 100,
                                                    child: Card(
                                                      elevation: 5,
                                                      color: AppColors.darkerGrey.withOpacity(0.5),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(6),
                                                              child: SizedBox(
                                                                height: 100,
                                                                child: Hero(
                                                                  tag: 'character_picture_${documentSnapshotCharacters.id}',
                                                                  child: CharacterPicture(
                                                                    pathToPicture: documentSnapshotCharacters['character_path_to_picture'],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              documentSnapshotCharacters['character_name'],
                                                              textAlign: TextAlign.center,
                                                              style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(
                                                                color: AppColors.semiWhite,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  "Level ${documentSnapshotCharacters['character_level']}".toString(),
                                                                  style: DefaultTextTheme.titilliumWebRegular13(context),
                                                                ),
                                                                Text(
                                                                  documentSnapshotCharacters['character_class'],
                                                                  style: DefaultTextTheme.titilliumWebRegular13(context),
                                                                ),
                                                                Text(
                                                                  documentSnapshotCharacters['character_race'],
                                                                  style: DefaultTextTheme.titilliumWebRegular13(context),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () async {
                                                    try {
                                                      getIt<CurrentCharacterCubit>().delete();
                                                      await getIt<CharactersApi>().setCharacterIntoCubits(documentSnapshotCharacters.id);
                                                      getIt<AppRouter>().navigate(
                                                        ViewCharacterRoute(
                                                            characterId: documentSnapshotCharacters.id,
                                                            canEdit: documentSnapshotCharacters['account_id'] ==
                                                                getIt<CurrentUserAdditionalData>().state?.accountId),
                                                      );
                                                    } catch (e) {
                                                      showSnackBar("Error occured");
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      }
                                      return const SizedBox();
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      "No characters yet",
                                      style: DefaultTextTheme.titilliumWebRegular16(context),
                                    ),
                                  ),
                            const SizedBox(height: 120),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
