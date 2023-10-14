import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/settings/routes/app_router.dart';
import 'package:fantastic_assistant/settings/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../../../utils/global_var/default_text_theme.dart';
import '../../../widgets/background/auth_background_container.dart';
import '../../../widgets/buttons/default_button.dart';
import 'widgets/text_and_clickable_text_row.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AuthBackgroundContainer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 400,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: [0, 1, 2].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            Expanded(
                              child: Card(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/welcome_image_$i.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                titlesList[i],
                                style: DefaultTextTheme.titilliumWebBold20(
                                    context),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                descriptionList[i],
                                textAlign: TextAlign.center,
                                style: DefaultTextTheme.titilliumWebRegular16(
                                    context),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: 52,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _controller.animateToPage(0);
                          setState(() {});
                        },
                        child: Container(
                          height: 4,
                          width: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.animateToPage(1);
                          setState(() {});
                        },
                        child: Container(
                          height: 4,
                          width: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.animateToPage(2);
                          setState(() {});
                        },
                        child: Container(
                          height: 4,
                          width: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
