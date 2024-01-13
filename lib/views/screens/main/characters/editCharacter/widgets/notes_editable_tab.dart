import 'package:flutter/material.dart';

import '../../../../../../utils/global_var/default_text_theme.dart';
import '../../../../../../widgets/buttons/default_button.dart';

class NotesEditableTab extends StatelessWidget {
  final List<TextEditingController> notesControllers;
  final int notesIndex;
  final Function changeNotesIndex;
  final Function removeNote;
  final Function addNote;
  const NotesEditableTab({
    super.key,
    required this.notesControllers,
    required this.notesIndex,
    required this.changeNotesIndex,
    required this.removeNote,
    required this.addNote,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        notesControllers.isNotEmpty
            ? Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: notesControllers.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: SizedBox(
                                  width: 100,
                                  child: TextButton(
                                    onPressed: () {
                                      changeNotesIndex(index);
                                    },
                                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                                    child: Text(
                                      notesControllers[index].text != '' ? notesControllers[index].text : "Note $index",
                                      style: notesIndex == index
                                          ? DefaultTextTheme.titilliumWebBold16(context)!.copyWith(overflow: TextOverflow.ellipsis)
                                          : DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                    style: DefaultTextTheme.titilliumWebRegular16(
                      context,
                    ),
                    minLines: 5,
                    maxLines: 5,
                    controller: notesControllers[notesIndex],
                  ),
                  const SizedBox(height: 10),
                ],
              )
            : const SizedBox(),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: DefaultButton(
                  text: 'Delete note ',
                  function: () {
                    removeNote();
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
                    addNote();
                  },
                  height: 50,
                  icon: Icons.add_sharp,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
