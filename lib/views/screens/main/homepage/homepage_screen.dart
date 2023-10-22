import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBackgroundContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Homepage screen',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
