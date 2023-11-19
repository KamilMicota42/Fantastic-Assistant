import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/default_button.dart';
import 'package:fantastic_assistant/widgets/buttons/go_back_title_row.dart';
import 'package:flutter/material.dart';

import '../../../../../settings/injection.dart';
import '../../../../../settings/routes/app_router.dart';
import '../../../../../settings/routes/app_router.gr.dart';

@RoutePage()
class CreateCharacterThirdScreen extends StatefulWidget {
  const CreateCharacterThirdScreen({super.key});

  @override
  State<CreateCharacterThirdScreen> createState() =>
      _CreateCharacterThirdScreenState();
}

class _CreateCharacterThirdScreenState
    extends State<CreateCharacterThirdScreen> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GoBackTitleRow(
                        screenTitle: 'Create Character',
                        popFunction: () {
                          getIt<AppRouter>().navigate(const CharactersRoute());
                        },
                        isX: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: DefaultButton(
                          text: 'Next',
                          height: 50,
                          function: () async {},
                          icon: Icons.arrow_forward_ios_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
