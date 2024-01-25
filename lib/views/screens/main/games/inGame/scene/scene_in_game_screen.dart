import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/character_picture.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game_id.dart';
import 'package:fantastic_assistant/views/screens/main/games/inGame/scene/widgets/scene_picture_in_game.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/others/default_divider.dart';
import 'package:flutter/material.dart';

import '../../../../../../settings/injection.dart';
import '../../../../../../settings/routes/app_router.dart';
import '../../../../../../utils/const/app_colors.dart';
import '../../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../../widgets/buttons/go_back_title_row.dart';

@RoutePage()
class SceneInGameScreen extends StatefulWidget {
  const SceneInGameScreen({super.key});

  @override
  State<SceneInGameScreen> createState() => _SceneInGameScreenState();
}

class _SceneInGameScreenState extends State<SceneInGameScreen> {
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
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                children: [
                                  GoBackTitleRow(
                                    screenTitle: "SCENE",
                                    isX: true,
                                    popFunction: () {
                                      getIt<AppRouter>().pop();
                                    },
                                    rightSideWidget: getIt<CurrentUserAdditionalData>().state!.accountId == getIt<CurrentGameCubit>().state?.dmId
                                        ? IconButton(
                                            onPressed: () {
                                              getIt<AppRouter>().navigate(const DmEditSceneInGameRoute());
                                            },
                                            icon: const Icon(
                                              Icons.settings_sharp,
                                              color: AppColors.white,
                                            ),
                                          )
                                        : null,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${snapshot.data?['game_name'] ?? 'Game title'}',
                                      style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.grey),
                                    ),
                                  ),
                                  const DefaultDivider(),
                                  const SizedBox(height: 12),
                                  ScenePictureInGame(
                                    pathToPicture: snapshot.data?['game_path_to_picture'],
                                    width: MediaQuery.of(context).size.width - 32,
                                    height: MediaQuery.of(context).size.width - 32,
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Characters',
                                      style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.grey),
                                    ),
                                  ),
                                  const DefaultDivider(),
                                  const SizedBox(height: 6),
                                ],
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
                                                return SizedBox(
                                                  height: 100,
                                                  child: Card(
                                                    color: AppColors.semiWhite.withOpacity(0.5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(6),
                                                            child: SizedBox(
                                                              height: 100,
                                                              child: CharacterPicture(
                                                                pathToPicture: documentSnapshotCharacters['character_path_to_picture'],
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
                                      "No friends yet",
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
