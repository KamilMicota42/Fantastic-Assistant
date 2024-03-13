import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantastic_assistant/models/user/user_additional_data.dart';
import 'package:fantastic_assistant/services/api/users/user_data_api.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/input/default_text_field_w_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../widgets/buttons/go_back_title_row.dart';
import '../../../inital_loading/cubits/firebase_auth_current_user_uid.dart';
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
                        getIt<AppRouter>().maybePop();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DefaultTextFieldWLabel(
                      labelText: 'FindUser',
                      labelColor: AppColors.white,
                      suffixIcon: const Icon(
                        Icons.search_sharp,
                        color: AppColors.white,
                      ),
                      onChanged: (value) {
                        users = FirebaseFirestore.instance
                            .collection('userAdditionalData')
                            .orderBy('account_display_name')
                            .where('account_display_name', isGreaterThanOrEqualTo: value)
                            .where('account_display_name', isLessThan: value + 'z');
                        setState(() {});
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
                                        elevation: 5,
                                        color: AppColors.darkerGrey.withOpacity(0.5),
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
                                                  getIt<UserDataApi>().sendFriendRequest(documentSnapshot.id);
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
