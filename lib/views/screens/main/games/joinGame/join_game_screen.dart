import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/api/characters/firebase_characters_api.dart';
import 'package:fantastic_assistant/services/api/games/fierbase_games_api.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character_id.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game_id.dart';
import 'package:fantastic_assistant/views/screens/main/games/cubits/current_game.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:fantastic_assistant/widgets/others/default_divider.dart';
import 'package:flutter/material.dart';

import '../../../../../settings/injection.dart';
import '../../../../../settings/routes/app_router.dart';
import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../widgets/buttons/go_back_title_row.dart';
import '../../characters/widgets/character_picture.dart';
import '../../characters/widgets/title_left.dart';

@RoutePage()
class JoinGameScreen extends StatefulWidget {
  final bool isUserDm;
  const JoinGameScreen({
    super.key,
    required this.isUserDm,
  });

  @override
  State<JoinGameScreen> createState() => _JoinGameScreenState();
}

class _JoinGameScreenState extends State<JoinGameScreen> {
  final _characters = FirebaseFirestore.instance.collection('characters').where(
        'account_id',
        isEqualTo: getIt<CurrentUserAdditionalData>().state?.accountId,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GoBackTitleRow(
                        screenTitle: "Join game",
                        popFunction: () {
                          getIt<AppRouter>().pop();
                        },
                      ),
                      const SizedBox(height: 6),
                      widget.isUserDm
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: DefaultButton(
                                    text: 'As dungeon master',
                                    height: 50,
                                    function: () {
                                      getIt<CurrentCharacterCubit>().delete();
                                      getIt<CurrentCharacterId>().delete();
                                      getIt<AppRouter>().navigate(const MainGameRoute());
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            )
                          : const SizedBox(),
                      Expanded(
                        child: Column(
                          children: [
                            const TitleLeft(
                              text: 'As character',
                              textColor: AppColors.white,
                            ),
                            const DefaultDivider(),
                            const SizedBox(height: 6),
                            StreamBuilder(
                              stream: _characters.snapshots(),
                              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                                if (streamSnapshot.hasData) {
                                  return Expanded(
                                    child: ListView.builder(
                                      padding: const EdgeInsets.only(bottom: 200),
                                      itemCount: streamSnapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                                        return InkWell(
                                          child: SizedBox(
                                            height: 100,
                                            child: Card(
                                              color: AppColors.darkerGrey,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(6),
                                                      child: SizedBox(
                                                        child: CharacterPicture(
                                                          pathToPicture: documentSnapshot['character_path_to_picture'],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      documentSnapshot['character_name'],
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
                                                          "Level ${documentSnapshot['character_level']}".toString(),
                                                          style: DefaultTextTheme.titilliumWebRegular13(context),
                                                        ),
                                                        Text(
                                                          documentSnapshot['character_class'],
                                                          style: DefaultTextTheme.titilliumWebRegular13(context),
                                                        ),
                                                        Text(
                                                          documentSnapshot['character_race'],
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
                                            if (!getIt<CurrentGameCubit>().state!.charactersId!.contains(documentSnapshot.id)) {
                                              await getIt<CreateGamesApi>().addCharacterToTable(getIt<CurrentGameId>().state!, documentSnapshot.id);
                                            }
                                            await getIt<CreateCharactersApi>().setCharacterIntoCubits(documentSnapshot.id);
                                            getIt<AppRouter>().push(const MainGameRoute());
                                          },
                                        );
                                      },
                                    ),
                                  );
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
