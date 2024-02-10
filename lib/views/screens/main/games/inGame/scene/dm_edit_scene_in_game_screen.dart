import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/character_picture.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/title_left.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game_id.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/input/default_text_field_w_label.dart';
import 'package:fantastic_assistant/widgets/others/default_divider.dart';
import 'package:flutter/material.dart';
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
                      gameNameController.text = snapshot.data?['game_name'] ?? '';
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
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                children: [
                                  GoBackTitleRow(
                                    screenTitle: "SCENE",
                                    popFunction: () {
                                      getIt<AppRouter>().pop();
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
                                        );
                                        getIt<AppRouter>().pop();
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
                                    width: MediaQuery.of(context).size.width - 32,
                                    height: MediaQuery.of(context).size.width - 32,
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
                                                final DocumentSnapshot documentSnapshotCharacters = streamSnapshotCharacters.data!.docs[index];
                                                return SizedBox(
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
                                                          child: charactersToRemove.contains(documentSnapshotCharacters.id)
                                                              ? IconButton(
                                                                  icon: const Icon(
                                                                    Icons.replay_sharp,
                                                                    color: AppColors.white,
                                                                  ),
                                                                  onPressed: () {
                                                                    charactersToRemove.remove(documentSnapshotCharacters.id);
                                                                    setState(() {});
                                                                  },
                                                                )
                                                              : IconButton(
                                                                  icon: const Icon(
                                                                    Icons.delete_sharp,
                                                                    color: AppColors.white,
                                                                  ),
                                                                  onPressed: () {
                                                                    charactersToRemove.add(documentSnapshotCharacters.id);
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
