import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/global_var/default_text_theme.dart';

class CharacterNotesWidget extends StatefulWidget {
  final List<dynamic> listOfNotes;
  const CharacterNotesWidget({super.key, required this.listOfNotes});

  @override
  State<CharacterNotesWidget> createState() => _CharacterNotesWidgetState();
}

class _CharacterNotesWidgetState extends State<CharacterNotesWidget> {
  int currNoteIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.listOfNotes.isEmpty) {
      return Center(
        child: Text(
          "No notes yet",
          style: DefaultTextTheme.titilliumWebRegular16(context),
        ),
      );
    }
    return widget.listOfNotes.isNotEmpty
        ? Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 20,
                child: ListView.builder(
                  itemCount: widget.listOfNotes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        currNoteIndex = index;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: SizedBox(
                          width: 100,
                          child: Text(
                            widget.listOfNotes[index],
                            style: index == currNoteIndex
                                ? DefaultTextTheme.titilliumWebBold16(context)!.copyWith(overflow: TextOverflow.ellipsis)
                                : DefaultTextTheme.titilliumWebRegular16(context)!.copyWith(overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/note_background.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.listOfNotes[currNoteIndex],
                              style: DefaultTextTheme.titilliumWebRegular16(context),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        : const SizedBox();
  }
}
