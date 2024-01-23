import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/character_picture.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game_id.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/input/default_text_field_w_label.dart';
import 'package:flutter/material.dart';

import '../../../../../../settings/injection.dart';
import '../../../../../../settings/routes/app_router.dart';
import '../../../../../../utils/const/app_colors.dart';
import '../../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../../widgets/buttons/add_photo_icon_button.dart';
import '../../../../../../widgets/buttons/go_back_title_row.dart';

@RoutePage()
class DmEditSceneInGameScreen extends StatefulWidget {
  const DmEditSceneInGameScreen({super.key});

  @override
  State<DmEditSceneInGameScreen> createState() => _DmEditSceneInGameScreenState();
}

class _DmEditSceneInGameScreenState extends State<DmEditSceneInGameScreen> {
  var game = FirebaseFirestore.instance.collection('games').doc(getIt<CurrentGameId>().state).snapshots();

  File? pictureValue;
  TextEditingController gameNameController = TextEditingController();
  List<dynamic> charactersId = [];

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
                      charactersId = snapshot.data?['characters_id'] ?? [];
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
                                    popFunction: () {
                                      getIt<AppRouter>().pop();
                                    },
                                    rightSideWidget: IconButton(
                                      icon: const Icon(Icons.save_sharp),
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: DefaultTextFieldWLabel(
                                      labelText: 'Game name',
                                      textController: gameNameController,
                                    ),
                                  ),
                                  const Divider(),
                                  const SizedBox(height: 6),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 32,
                                    height: MediaQuery.of(context).size.width - 32,
                                    child: AddPhotoIconButton(
                                      onTapFunction: (var value) {
                                        pictureValue = value;
                                      },
                                      onChange: () {},
                                      initialImageUrl: snapshot.data?['game_path_to_picture'],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Characters',
                                      style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(color: AppColors.black),
                                    ),
                                  ),
                                  const Divider(),
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
                                              itemCount: charactersId.length,
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                final DocumentSnapshot documentSnapshotCharacters = streamSnapshotCharacters.data!.docs[index];
                                                return SizedBox(
                                                  height: 100,
                                                  child: Card(
                                                    color: AppColors.lighterGrey.withOpacity(0.5),
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
                                                              color: AppColors.darkerGrey,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: IconButton(
                                                            icon: const Icon(Icons.cancel_outlined),
                                                            onPressed: () {
                                                              charactersId.remove(documentSnapshotCharacters.id);
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
