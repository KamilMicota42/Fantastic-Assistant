import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character_id.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/character_picture.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game_id.dart';
import 'package:fantastic_assistant/views/screens/main/games/inGame/scene/widgets/scene_picture_in_game.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/others/default_divider.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/character_token/character_token.dart';
import '../../../../../../services/api/games/games_api.dart';
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

  bool isDm = false;
  bool initBuild = true;
  bool isMap = false;
  int mapWidthGrid = 2;
  int mapHeightGrid = 2;

  CharacterToken? currCharacterToken;
  List<CharacterToken> tokensList = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                      if (initBuild) {
                        isMap = snapshot.data?['is_map'] ?? false;
                        mapWidthGrid = snapshot.data?['map_width_grid'] ?? 2;
                        mapHeightGrid = snapshot.data?['map_height_grid'] ?? 2;
                        for (var i = 0; i < snapshot.data?['tokens_on_map'].length; i++) {
                          tokensList.add(CharacterToken.fromJson(snapshot.data?['tokens_on_map'][i]));
                        }
                      }

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
                              child: Column(
                                children: [
                                  GoBackTitleRow(
                                    screenTitle: "SCENE",
                                    isX: true,
                                    popFunction: () {
                                      getIt<AppRouter>().maybePop();
                                    },
                                    rightSideWidget: isDm
                                        ? IconButton(
                                            onPressed: () {
                                              getIt<AppRouter>().navigate(const DmEditSceneInGameRoute());
                                            },
                                            icon: const Icon(
                                              Icons.settings_sharp,
                                              color: AppColors.white,
                                            ),
                                          )
                                        : IconButton(
                                            icon: const Icon(
                                              Icons.save_sharp,
                                              color: AppColors.white,
                                            ),
                                            onPressed: () {
                                              List<String> listOfTokensInJson = [];
                                              for (var token in tokensList) {
                                                listOfTokensInJson.add(token.toJson());
                                              }
                                              getIt<GamesApi>().editTokensOnBoard(
                                                getIt<CurrentGameId>().state!,
                                                listOfTokensInJson,
                                              );
                                            },
                                          ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${snapshot.data?['game_name'] ?? 'Game title'}',
                                      style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.greenWhite),
                                    ),
                                  ),
                                  const DefaultDivider(),
                                  const SizedBox(height: 12),
                                  InteractiveViewer(
                                    panEnabled: false,
                                    boundaryMargin: const EdgeInsets.all(0),
                                    minScale: 0.9,
                                    maxScale: 4,
                                    child: SizedBox(
                                      width: screenWidth - 32,
                                      height: screenWidth - 32,
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            width: screenWidth - 32,
                                            height: screenWidth - 32,
                                            child: ScenePictureInGame(
                                              pathToPicture: snapshot.data?['game_path_to_picture'],
                                              width: screenWidth - 32,
                                              height: screenWidth - 32,
                                            ),
                                          ),
                                          isMap
                                              ? ListView.builder(
                                                  itemCount: mapHeightGrid,
                                                  scrollDirection: Axis.vertical,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.zero,
                                                  itemBuilder: (context, widthIndex) {
                                                    return SizedBox(
                                                      height: (screenWidth - 32) / mapHeightGrid,
                                                      child: ListView.builder(
                                                        itemCount: mapWidthGrid,
                                                        scrollDirection: Axis.horizontal,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        padding: EdgeInsets.zero,
                                                        itemBuilder: (context, heightIndex) {
                                                          int? indexOnLocalTokensList;
                                                          for (var i = 0; i < tokensList.length; i++) {
                                                            if (tokensList[i].width == widthIndex && tokensList[i].height == heightIndex) {
                                                              indexOnLocalTokensList = i;
                                                            }
                                                          }
                                                          return InkWell(
                                                            onTap: () {
                                                              if (indexOnLocalTokensList != null) {
                                                                tokensList.removeAt(indexOnLocalTokensList!);
                                                              }
                                                              if (currCharacterToken?.characterId != null) {
                                                                currCharacterToken = CharacterToken(
                                                                  width: widthIndex,
                                                                  height: heightIndex,
                                                                  characterId: currCharacterToken!.characterId,
                                                                  characterPicture: currCharacterToken!.characterPicture,
                                                                );
                                                                tokensList.add(currCharacterToken!);
                                                              }
                                                              currCharacterToken = null;
                                                              indexOnLocalTokensList = null;
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width: (screenWidth - 32) / mapWidthGrid,
                                                              height: (screenWidth - 32) / mapHeightGrid,
                                                              decoration: BoxDecoration(
                                                                color: Colors.transparent,
                                                                border: Border.all(
                                                                  color: AppColors.white.withOpacity(0.5),
                                                                ),
                                                              ),
                                                              child: indexOnLocalTokensList != null
                                                                  ? SizedBox(
                                                                      width: ((screenWidth - 32) / mapWidthGrid / 2),
                                                                      child: CharacterPicture(
                                                                        pathToPicture: tokensList[indexOnLocalTokensList].characterPicture,
                                                                      ),
                                                                    )
                                                                  : const SizedBox(),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Characters',
                                      style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.greenWhite),
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
                                                  width: 100,
                                                  child: Card(
                                                    elevation: 5,
                                                    color: AppColors.darkerGrey.withOpacity(0.5),
                                                    child: Row(
                                                      children: [
                                                        documentSnapshotCharacters.id == getIt<CurrentCharacterId>().state
                                                            ? InkWell(
                                                                onTap: () {
                                                                  currCharacterToken = CharacterToken(
                                                                    characterId: documentSnapshotCharacters.id,
                                                                    characterPicture: documentSnapshotCharacters['character_path_to_picture'],
                                                                  );
                                                                },
                                                                customBorder: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(6),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(6),
                                                                  child: SizedBox(
                                                                    height: 100,
                                                                    width: 100,
                                                                    child: CharacterPicture(
                                                                      pathToPicture: documentSnapshotCharacters['character_path_to_picture'],
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Padding(
                                                                padding: const EdgeInsets.all(6),
                                                                child: SizedBox(
                                                                  height: 100,
                                                                  width: 100,
                                                                  child: CharacterPicture(
                                                                    pathToPicture: documentSnapshotCharacters['character_path_to_picture'],
                                                                  ),
                                                                ),
                                                              ),
                                                        Expanded(
                                                          flex: 1,
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
