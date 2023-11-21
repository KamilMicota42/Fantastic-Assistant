import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/services/api/characters/firebase_characters_api.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:fantastic_assistant/widgets/others/default_divider.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/const/app_colors.dart';
import '../../../../../utils/dnd_rules/dnd_hints.dart';
import '../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../widgets/buttons/go_back_title_row.dart';
import '../cubits/current_character_id.dart';
import '../logic/show_hint.dart';

@RoutePage()
class CreateCharacterFifthScreen extends StatefulWidget {
  const CreateCharacterFifthScreen({super.key});

  @override
  State<CreateCharacterFifthScreen> createState() =>
      _CreateCharacterFifthScreenState();
}

class _CreateCharacterFifthScreenState
    extends State<CreateCharacterFifthScreen> {
  int notesAmount = 0;
  List<TextEditingController> listControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Add notes to Your character',
                      style: DefaultTextTheme.titilliumWebBold20(context),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: DefaultButton(
                          text: 'Delete note ',
                          function: () {
                            notesAmount--;
                            if (notesAmount < 0) {
                              notesAmount = 0;
                            }
                            setState(() {});
                          },
                          height: 50,
                          icon: Icons.remove_sharp,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DefaultButton(
                          text: 'Add note ',
                          function: () {
                            notesAmount++;
                            if (notesAmount > 10) {
                              notesAmount = 10;
                              showSnackBar(
                                'Character can contain maximum 10 notes.',
                              );
                            }
                            setState(() {});
                          },
                          height: 50,
                          icon: Icons.add_sharp,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: [
                          notesAmount > 0
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(bottom: 120),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: notesAmount,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        const DefaultDivider(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border:
                                                    const OutlineInputBorder(),
                                                hintText: 'Note ${index + 1}'),
                                            style: DefaultTextTheme
                                                .titilliumWebRegular16(
                                              context,
                                            ),
                                            minLines: 3,
                                            maxLines: 3,
                                            controller: listControllers[index],
                                          ),
                                        ),
                                        const DefaultDivider(),
                                      ],
                                    );
                                  },
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GoBackTitleRow(
                      screenTitle: 'Create Character',
                      popFunction: () {
                        getIt<AppRouter>().navigate(const CharactersRoute());
                      },
                      isX: true,
                      rightSideWidget: InkWell(
                        onTap: () {
                          showHint(
                            context,
                            hintsList['notes']!,
                          );
                        },
                        child: const Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              Icons.question_mark_sharp,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: DefaultButton(
                        text: 'Next',
                        height: 50,
                        function: () {
                          List<String> listOfNotes = [];
                          for (var i = 0; i < notesAmount; i++) {
                            listOfNotes.add(listControllers[i].text);
                          }
                          getIt<CreateCharactersApi>().setCharacterNotes(
                            getIt<CurrentCharacterId>().state!,
                            listOfNotes,
                          );
                        },
                        icon: Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
