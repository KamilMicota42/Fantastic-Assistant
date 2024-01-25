import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/models/user/user_additional_data.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../widgets/buttons/go_back_title_row.dart';
import '../../characters/widgets/character_picture.dart';

@RoutePage()
class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final friends = FirebaseFirestore.instance.collection('userAdditionalData').where(
        'friends',
        arrayContains: getIt<CurrentUserAdditionalData>().state?.accountId,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GoBackTitleRow(
                      screenTitle: "Friends",
                      popFunction: () {
                        getIt<AppRouter>().pop();
                      },
                      rightSideWidget: IconButton(
                        onPressed: () {
                          getIt<AppRouter>().navigate(const UsersRoute());
                        },
                        icon: const Icon(
                          Icons.add_box_sharp,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<CurrentUserAdditionalData, UserAdditionalData?>(
                    bloc: getIt<CurrentUserAdditionalData>(),
                    builder: (context, state) {
                      return StreamBuilder(
                        stream: friends.snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (streamSnapshot.hasData) {
                            if (streamSnapshot.data!.docs.isEmpty) {
                              return Expanded(
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "No friends yet",
                                    style: DefaultTextTheme.titilliumWebRegular16(context),
                                  ),
                                ),
                              );
                            }
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 200),
                                  shrinkWrap: true,
                                  itemCount: streamSnapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                                    return Card(
                                      color: AppColors.darkerGrey,
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
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
