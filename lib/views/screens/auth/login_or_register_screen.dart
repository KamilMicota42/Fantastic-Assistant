import 'package:auto_route/auto_route.dart';

import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:fantastic_assistant/utils/const/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/global_var/default_text_theme.dart';
import '../../../widgets/background/auth_background_container.dart';
import '../../../widgets/buttons/default_button.dart';
import 'widgets/text_and_clickable_text_row.dart';
import 'dart:async';

@RoutePage()
class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  final CarouselController _controller = CarouselController();
  List<String> titlesList = ['Create character', 'Take notes', 'Make a story'];
  List<String> descriptionList = [
    'Forge mighty heroes and craft intricate backstories, keep it all in pocket',
    'Unravel secrets, and keep track of essential details, ensuring no treasure or crucial plot point goes forgotten.',
    'Unleash epic narratives, shape destiny, and immerse yourself in a world of endless possibilities.'
  ];
  Timer? timer;
  List<double> offsetValues = [300, 600, 0];
  int index = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) => sliderAnimate());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              SizedBox(
                height: 500,
                width: 300,
                child: CarouselView(
                  controller: _controller,
                  itemExtent: 500,
                  shrinkExtent: 300,
                  backgroundColor: Colors.transparent,
                  itemSnapping: true,
                  children: [0, 1, 2].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: Image.asset(
                                'assets/images/welcome_image_$i.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                titlesList[i],
                                style: DefaultTextTheme.titilliumWebBold20(context),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 100,
                                width: 300,
                                child: Text(
                                  descriptionList[i],
                                  textAlign: TextAlign.center,
                                  style: DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(color: AppColors.semiWhite),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Column(
                children: [
                  DefaultButton(
                    text: "Register",
                    function: () {
                      getIt<AppRouter>().navigate(const RegisterRoute());
                    },
                    height: 56,
                  ),
                  const SizedBox(height: 20),
                  TextAndClickableTextRow(
                    contentText: 'Have an account?',
                    clickableContentText: 'Log in',
                    function: () {
                      getIt<AppRouter>().navigate(const LoginRoute());
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sliderAnimate() async {
    _controller.animateTo(offsetValues[index], duration: const Duration(milliseconds: 300), curve: Curves.linear);
    index = (index + 1) % offsetValues.length;
  }
}
