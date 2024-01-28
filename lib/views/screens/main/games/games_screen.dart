import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/api/games/fierbase_games_api.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/views/screens/main/games/widgets/scene_picture.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:flutter/material.dart';

import '../../../../services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import '../../../../utils/const/app_colors.dart';
import '../../../../utils/global_var/default_text_theme.dart';
import '../../../../widgets/buttons/default_button.dart';
import '../../../../widgets/buttons/title_row.dart';

@RoutePage()
class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  final _games = FirebaseFirestore.instance.collection('games').where(
        'players_id',
        arrayContains: getIt<CurrentUserAdditionalData>().state?.accountId,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleRow(screenTitle: 'GAMES'),
                    StreamBuilder(
                      stream: _games.snapshots(),
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
                                                child: ScenePicture(
                                                  pathToPicture: documentSnapshot['game_path_to_picture'],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              documentSnapshot['game_name'],
                                              textAlign: TextAlign.center,
                                              style: DefaultTextTheme.titilliumWebBold20(context)!.copyWith(
                                                color: AppColors.semiWhite,
                                              ),
                                            ),
                                          ),
                                          const Expanded(flex: 1, child: SizedBox()),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    await getIt<CreateGamesApi>().setGameIntoCubits(documentSnapshot.id);
                                    getIt<AppRouter>().navigate(
                                      JoinGameRoute(isUserDm: documentSnapshot['dm_id'] == getIt<CurrentUserAdditionalData>().state?.accountId),
                                    );
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
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 125,
                    ),
                    child: DefaultButton(
                      text: 'Create a new game',
                      height: 50,
                      function: () {
                        getIt<AppRouter>().navigate(const EditGameRoute());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
