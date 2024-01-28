import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/api/characters/firebase_characters_api.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:fantastic_assistant/utils/global_var/default_text_theme.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character.dart';
import 'package:fantastic_assistant/views/screens/main/characters/cubits/current_character_id.dart';
import 'package:fantastic_assistant/views/screens/main/characters/widgets/character_picture.dart';
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
  final _characters = FirebaseFirestore.instance
      .collection('characters')
      .where(
        'account_id',
        isEqualTo: getIt<CurrentUserAdditionalData>().state?.accountId,
      )
      .snapshots();

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
                    const TitleRow(screenTitle: 'CHARACTERS'),
                    StreamBuilder(
                      stream: _characters,
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
                                    try {
                                      getIt<CurrentCharacterCubit>().delete();
                                      await getIt<CreateCharactersApi>().setCharacterIntoCubits(documentSnapshot.id);
                                      getIt<AppRouter>().navigate(const ViewCharacterRoute());
                                    } catch (e) {
                                      showSnackBar("Error occured");
                                    }
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
                      text: 'Create a new character',
                      height: 50,
                      function: () {
                        getIt<CurrentCharacterCubit>().delete();
                        getIt<CurrentCharacterId>().delete();
                        getIt<AppRouter>().navigate(const EditCharacterRoute());
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
