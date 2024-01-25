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
class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  var users = FirebaseFirestore.instance.collection('userAdditionalData').orderBy('account_display_name');

  @override
  void initState() {
    super.initState();
  }

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
                      screenTitle: "Users",
                      popFunction: () {
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
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 200),
                                  shrinkWrap: true,
                                  itemCount: streamSnapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                                    if (documentSnapshot.id != state!.accountId && !state.friends!.contains(documentSnapshot.id)) {
                                      return Card(
                                        color: AppColors.darkerGrey,
                                        child: SizedBox(
                                          height: 100,
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.all(6),
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
                                              IconButton(
                                                onPressed: () {
                                                  getIt<FirebaseUserData>().sendFriendRequest(
                                                    documentSnapshot.id,
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.add_sharp,
                                                  color: AppColors.semiWhite,
                                                ),
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
