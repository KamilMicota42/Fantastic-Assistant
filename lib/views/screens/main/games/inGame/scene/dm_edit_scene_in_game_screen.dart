import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/models/character_token/character_token.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/character_picture.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/title_left.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game_id.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/input/default_text_field_w_label.dart';
import 'package:fantastic_assistant/widgets/others/default_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../models/user/user_additional_data.dart';
import '../../../../../../services/api/games/games_api.dart';
import '../../../../../../settings/injection.dart';
import '../../../../../../settings/routes/app_router.dart';
import '../../../../../../utils/const/app_colors.dart';
import '../../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../../widgets/buttons/add_photo_icon_button.dart';
import '../../../../../../widgets/buttons/go_back_title_row.dart';
import '../../../../inital_loading/cubits/firebase_auth_current_user_uid.dart';

@RoutePage()
class DmEditSceneInGameScreen extends StatefulWidget {
  const DmEditSceneInGameScreen({super.key});

  @override
  State<DmEditSceneInGameScreen> createState() => _DmEditSceneInGameScreenState();
}

class _DmEditSceneInGameScreenState extends State<DmEditSceneInGameScreen> {
  var game = FirebaseFirestore.instance.collection('games').doc(getIt<CurrentGameId>().state).snapshots();

  File? pictureValue;
  bool hasPictureChanged = false;
  TextEditingController gameNameController = TextEditingController();
  List<dynamic> charactersToRemove = [];

  final friends = FirebaseFirestore.instance.collection('userAdditionalData').where(
        'friends',
        arrayContains: getIt<CurrentUserAdditionalData>().state?.accountId,
      );
  List<dynamic> listOfPlayersId = [];
  bool initBuild = true;
  bool isMap = false;
  TextEditingController mapWidthGrid = TextEditingController(text: "2");
  TextEditingController mapHeightGrid = TextEditingController(text: "2");
  CharacterToken? currCharacterToken;
  List<CharacterToken> tokensList = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    print(tokensList);
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
                        gameNameController.text = snapshot.data?['game_name'] ?? '';
                        isMap = snapshot.data?['is_map'] ?? false;
                        mapWidthGrid.text = snapshot.data?['map_width_grid'].toString() ?? "2";
                        mapHeightGrid.text = snapshot.data?['map_height_grid'].toString() ?? "2";
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
                        if (snapshot.data?['players_id'].isNotEmpty && initBuild) {
                          listOfPlayersId = snapshot.data?['players_id'];
                          initBuild = false;
                        }
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
                                    popFunction: () {
                                      getIt<AppRouter>().maybePop();
                                    },
                                    rightSideWidget: IconButton(
                                      icon: const Icon(
                                        Icons.save_sharp,
                                        color: AppColors.white,
                                      ),
                                      onPressed: () {
                                        getIt<GamesApi>().editGame(
                                          getIt<CurrentGameId>().state!,
                                          pictureValue,
                                          hasPictureChanged,
                                          gameNameController.text,
                                          charactersToRemove,
                                          snapshot.data?['characters_id'],
                                          listOfPlayersId,
                                          isMap,
                                          int.parse(mapWidthGrid.text),
                                          int.parse(mapHeightGrid.text),
                                        );
                                        getIt<AppRouter>().maybePop();
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: DefaultTextFieldWLabel(
                                      labelText: 'Game name',
                                      textController: gameNameController,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    height: 26,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Board',
                                          style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.greenWhite),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              isMap ? 'map' : 'image',
                                              style: DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(color: AppColors.white),
                                            ),
                                            const SizedBox(width: 6),
                                            Switch(
                                              value: isMap,
                                              onChanged: (value) {
                                                isMap = value;
                                                setState(() {});
                                              },
                                              activeColor: AppColors.greenWhite,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  isMap
                                      ? Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 24),
                                              child: SizedBox(
                                                width: 100,
                                                child: DefaultTextFieldWLabel(
                                                  labelText: "width",
                                                  labelColor: AppColors.white,
                                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\-?\d*'))],
                                                  keyboardType: TextInputType.number,
                                                  textController: mapWidthGrid,
                                                  onChanged: (mapWidth) {
                                                    try {
                                                      if (mapWidth.toString() == "" ||
                                                          int.parse(mapWidth.toString()) > 32 ||
                                                          int.parse(mapWidth.toString()) < 1) {
                                                        throw Exception();
                                                      }
                                                      mapWidthGrid.text = int.parse(mapWidth).toString();
                                                      listOfPlayersId = [];
                                                      setState(() {});
                                                    } catch (e) {
                                                      showSnackBar("Value invalid");
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 12),
                                              child: SizedBox(
                                                width: 100,
                                                child: DefaultTextFieldWLabel(
                                                  labelText: "height",
                                                  labelColor: AppColors.white,
                                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\-?\d*'))],
                                                  keyboardType: TextInputType.number,
                                                  textController: mapHeightGrid,
                                                  onChanged: (mapHeight) {
                                                    try {
                                                      if (mapHeight.toString() == "" ||
                                                          int.parse(mapHeight.toString()) > 32 ||
                                                          int.parse(mapHeight.toString()) < 1) {
                                                        throw Exception();
                                                      }
                                                      mapHeightGrid.text = int.parse(mapHeight).toString();
                                                      listOfPlayersId = [];
                                                      setState(() {});
                                                    } catch (e) {
                                                      showSnackBar("Value invalid");
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
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
                                            child: AddPhotoIconButton(
                                              onTapFunction: (var value) {
                                                pictureValue = value;
                                              },
                                              onChange: () {
                                                hasPictureChanged = true;
                                              },
                                              initialImageUrl: snapshot.data?['game_path_to_picture'],
                                            ),
                                          ),
                                          isMap
                                              ? ListView.builder(
                                                  itemCount: int.parse(mapHeightGrid.text),
                                                  scrollDirection: Axis.vertical,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.zero,
                                                  itemBuilder: (context, widthIndex) {
                                                    return SizedBox(
                                                      height: (screenWidth - 32) / int.parse(mapHeightGrid.text),
                                                      child: ListView.builder(
                                                        itemCount: int.parse(mapWidthGrid.text),
                                                        scrollDirection: Axis.horizontal,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        padding: EdgeInsets.zero,
                                                        itemBuilder: (context, heightIndex) {
                                                          return InkWell(
                                                            onTap: () {
                                                              if (currCharacterToken?.characterId != null) {
                                                                currCharacterToken = CharacterToken(
                                                                  width: widthIndex,
                                                                  height: heightIndex,
                                                                  characterId: currCharacterToken!.characterId,
                                                                  characterPicture: currCharacterToken!.characterPicture,
                                                                );
                                                                tokensList.add(currCharacterToken!);
                                                              }
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width: (screenWidth - 32) / int.parse(mapWidthGrid.text),
                                                              height: (screenWidth - 32) / int.parse(mapHeightGrid.text),
                                                              decoration: BoxDecoration(
                                                                color: Colors.transparent,
                                                                border: Border.all(
                                                                  color: AppColors.white.withOpacity(0.5),
                                                                ),
                                                              ),
                                                              // child: tokensOnMap.containsKey(CoordinatesOnMap(width: widthIndex, height: heightIndex))
                                                              //     ? SizedBox(
                                                              //         width: ((screenWidth - 32) / int.parse(mapWidthGrid.text) / 2),
                                                              //         child: CharacterPicture(
                                                              //           pathToPicture:
                                                              //               tokensOnMap[CoordinatesOnMap(width: widthIndex, height: heightIndex)]!
                                                              //                   .pathToPicture,
                                                              //         ),
                                                              //       )
                                                              //     : const SizedBox(),
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
                                  const TitleLeft(text: 'Characters'),
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
                                                final DocumentSnapshot documentSnapshotCharacter = streamSnapshotCharacters.data!.docs[index];
                                                return SizedBox(
                                                  height: 100,
                                                  child: Card(
                                                    elevation: 5,
                                                    color: AppColors.darkerGrey.withOpacity(0.5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: InkWell(
                                                            customBorder: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(6),
                                                            ),
                                                            child: Container(
                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(6),
                                                                child: SizedBox(
                                                                  height: 100,
                                                                  child: CharacterPicture(
                                                                    pathToPicture: documentSnapshotCharacter['character_path_to_picture'],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            onTap: () {
                                                              currCharacterToken = CharacterToken(
                                                                characterId: documentSnapshotCharacter.id,
                                                                characterPicture: documentSnapshotCharacter['character_path_to_picture'],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            documentSnapshotCharacter['character_name'],
                                                            textAlign: TextAlign.center,
                                                            style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(
                                                              color: AppColors.semiWhite,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: charactersToRemove.contains(documentSnapshotCharacter.id)
                                                              ? IconButton(
                                                                  icon: const Icon(
                                                                    Icons.replay_sharp,
                                                                    color: AppColors.white,
                                                                  ),
                                                                  onPressed: () {
                                                                    charactersToRemove.remove(documentSnapshotCharacter.id);
                                                                    setState(() {});
                                                                  },
                                                                )
                                                              : IconButton(
                                                                  icon: const Icon(
                                                                    Icons.delete_sharp,
                                                                    color: AppColors.white,
                                                                  ),
                                                                  onPressed: () {
                                                                    charactersToRemove.add(documentSnapshotCharacter.id);
                                                                    setState(() {});
                                                                  },
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
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 17),
                                    child: TitleLeft(text: 'Invite friends'),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 17),
                                    child: DefaultDivider(),
                                  ),
                                  const SizedBox(height: 6),
                                  BlocBuilder<CurrentUserAdditionalData, UserAdditionalData?>(
                                    bloc: getIt<CurrentUserAdditionalData>(),
                                    builder: (context, state) {
                                      return StreamBuilder(
                                        stream: friends.snapshots(),
                                        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                                          if (streamSnapshot.hasData) {
                                            if (streamSnapshot.data!.docs.isEmpty || streamSnapshot.data?.docs.length == null) {
                                              return Center(
                                                child: Text(
                                                  "No friends yet",
                                                  style: DefaultTextTheme.titilliumWebRegular16(context),
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: const EdgeInsets.only(bottom: 200),
                                              shrinkWrap: true,
                                              itemCount: streamSnapshot.data!.docs.length,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                                                return Card(
                                                  elevation: 5,
                                                  color: AppColors.darkerGrey.withOpacity(0.5),
                                                  child: SizedBox(
                                                    height: 100,
                                                    child: Row(
                                                      children: [
                                                        const Padding(
                                                          padding: EdgeInsets.only(left: 6, top: 6, bottom: 6),
                                                          child: SizedBox(
                                                            height: 100,
                                                            child: CharacterPicture(
                                                              pathToPicture: null,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                documentSnapshot['account_display_name'],
                                                                style: DefaultTextTheme.titilliumWebBold16(context),
                                                              ),
                                                              Text(
                                                                documentSnapshot['account_email'],
                                                                style: DefaultTextTheme.titilliumWebRegular13(context),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 6, top: 6, bottom: 6),
                                                          child: !listOfPlayersId.contains(documentSnapshot.id)
                                                              ? IconButton(
                                                                  onPressed: () {
                                                                    listOfPlayersId.add(documentSnapshot.id);
                                                                    setState(() {});
                                                                  },
                                                                  icon: const Icon(
                                                                    Icons.add_sharp,
                                                                    color: AppColors.semiWhite,
                                                                  ),
                                                                )
                                                              : IconButton(
                                                                  onPressed: () {
                                                                    listOfPlayersId.remove(documentSnapshot.id);
                                                                    setState(() {});
                                                                  },
                                                                  icon: const Icon(
                                                                    Icons.remove_sharp,
                                                                    color: AppColors.semiWhite,
                                                                  ),
                                                                ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                          return const CircularProgressIndicator();
                                        },
                                      );
                                    },
                                  ),
                                ],
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
