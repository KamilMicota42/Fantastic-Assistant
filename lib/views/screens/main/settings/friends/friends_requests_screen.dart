import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/models/user/user_additional_data.dart';
import 'package:fantastic_assistant/services/api/settings/firebase_database_user_data.dart';
import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../widgets/buttons/go_back_title_row.dart';
import '../../characters/widgets/character_picture.dart';

@RoutePage()
class FriendsRequestsScreen extends StatefulWidget {
  const FriendsRequestsScreen({super.key});

  @override
  State<FriendsRequestsScreen> createState() => _FriendsRequestsScreenState();
}

class _FriendsRequestsScreenState extends State<FriendsRequestsScreen> {
  var users = FirebaseFirestore.instance.collection('userAdditionalData').orderBy('account_display_name');

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
                      screenTitle: "Friends Requests",
                      popFunction: () async {
                        await getIt<FirebaseUserData>().getUserAdditionalDataToGetIt(getIt<CurrentUserAdditionalData>().state!.accountId);
                        getIt<AppRouter>().pop();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<CurrentUserAdditionalData, UserAdditionalData?>(
                    bloc: getIt<CurrentUserAdditionalData>(),
                    builder: (context, state) {
                      return StreamBuilder(
                        stream: users.snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (streamSnapshot.hasData) {
                            bool anyFriend = false;
                            for (var i = 0; i < streamSnapshot.data!.docs.length; i++) {
                              if (state!.friendsRequests!.contains(streamSnapshot.data!.docs[i].id)) {
                                anyFriend = true;
                              }
                            }
                            if (!anyFriend) {
                              return Expanded(
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "No friends requests yet",
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
                                    if (state!.friendsRequests!.contains(documentSnapshot.id)) {
                                      return Card(
                                        color: AppColors.lighterGrey,
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
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      getIt<FirebaseUserData>().declineFriendRequest(documentSnapshot.id);
                                                    },
                                                    icon: const Icon(Icons.cancel_outlined),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      getIt<FirebaseUserData>().acceptFriendRequest(documentSnapshot.id);
                                                    },
                                                    icon: const Icon(Icons.check_circle_outline),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
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
