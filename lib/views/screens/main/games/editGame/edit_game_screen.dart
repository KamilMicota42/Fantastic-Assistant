import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/services/api/games/games_api.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/others/default_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/user/user_additional_data.dart';
import '../../../../../settings/injection.dart';
import '../../../../../settings/routes/app_router.dart';
import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../widgets/buttons/add_photo_icon_button.dart';
import '../../../../../widgets/buttons/go_back_title_row.dart';
import '../../../../../widgets/input/default_text_field_w_label.dart';
import '../../../inital_loading/cubits/firebase_auth_current_user_uid.dart';
import '../../characters/widgets/character_picture.dart';
import '../../characters/widgets/title_left.dart';

@RoutePage()
class EditGameScreen extends StatefulWidget {
  const EditGameScreen({super.key});

  @override
  State<EditGameScreen> createState() => _EditGameScreenState();
}

class _EditGameScreenState extends State<EditGameScreen> {
  File? pictureValue;
  TextEditingController gametableNameController = TextEditingController();

  final friends = FirebaseFirestore.instance.collection('userAdditionalData').where(
        'friends',
        arrayContains: getIt<CurrentUserAdditionalData>().state?.accountId,
      );

  List<String> listOfInvitedFriends = [];

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
                        screenTitle: "Create game",
                        popFunction: () {
                          getIt<AppRouter>().pop();
                        },
                        rightSideWidget: IconButton(
                          onPressed: () {
                            getIt<GamesApi>().createGame(pictureValue, gametableNameController.text, listOfInvitedFriends);
                            getIt<AppRouter>().navigate(const GamesRoute());
                          },
                          icon: const Icon(
                            Icons.save_sharp,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 120),
                      SizedBox(
                        height: MediaQuery.of(context).size.width - 100,
                        width: MediaQuery.of(context).size.width - 100,
                        child: AddPhotoIconButton(
                          onTapFunction: (var value) {
                            pictureValue = value;
                          },
                          onChange: () {},
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: DefaultTextFieldWLabel(
                          textController: gametableNameController,
                          labelText: 'Table name',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitleLeft(text: 'Invite friends'),
                      const DefaultDivider(),
                      const SizedBox(height: 12),
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
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0),
                                  child: ListView.builder(
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
                                                child: !listOfInvitedFriends.contains(documentSnapshot.id)
                                                    ? IconButton(
                                                        onPressed: () {
                                                          listOfInvitedFriends.add(documentSnapshot.id);
                                                          setState(() {});
                                                        },
                                                        icon: const Icon(
                                                          Icons.add_sharp,
                                                          color: AppColors.semiWhite,
                                                        ),
                                                      )
                                                    : IconButton(
                                                        onPressed: () {
                                                          listOfInvitedFriends.remove(documentSnapshot.id);
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
                                  ),
                                );
                              }
                              return const CircularProgressIndicator();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
