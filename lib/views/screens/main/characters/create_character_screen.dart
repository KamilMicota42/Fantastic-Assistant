import 'package:auto_route/auto_route.dart';
import 'package:fantastic_assistant/widgets/background/auth_background_container.dart';
import 'package:fantastic_assistant/widgets/buttons/go_back_title_row.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateCharacterScreen extends StatefulWidget {
  const CreateCharacterScreen({super.key});

  @override
  State<CreateCharacterScreen> createState() => _CreateCharacterScreenState();
}

class _CreateCharacterScreenState extends State<CreateCharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBackgroundContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GoBackTitleRow(screenTitle: 'Create Character'),
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

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     Expanded(
//       child: TextField(
//         controller: _copperController,
//         decoration: const InputDecoration(hintText: 'Copper'),
//         keyboardType: TextInputType.number,
//       ),
//     ),
//     Expanded(
//       child: TextField(
//         controller: _silverController,
//         decoration: const InputDecoration(hintText: 'Silver'),
//         keyboardType: TextInputType.number,
//       ),
//     ),
//     Expanded(
//       child: TextField(
//         controller: _electrumController,
//         decoration: const InputDecoration(hintText: 'Electrum'),
//         keyboardType: TextInputType.number,
//       ),
//     ),
//     Expanded(
//       child: TextField(
//         controller: _goldController,
//         decoration: const InputDecoration(hintText: 'Gold'),
//         keyboardType: TextInputType.number,
//       ),
//     ),
//     Expanded(
//       child: TextField(
//         controller: _platinumController,
//         decoration: const InputDecoration(hintText: 'Platinum'),
//         keyboardType: TextInputType.number,
//       ),
//     ),
//   ],
// ),

// final Map<String, int?> _currenciesController = {
//   'Copper': int.parse(_copperController.text),
//   'Silver': int.parse(_silverController.text),
//   'Electrum': int.parse(_electrumController.text),
//   'Gold': int.parse(_goldController.text),
//   'Platinum': int.parse(_platinumController.text)
// };
// print(_currenciesController);
