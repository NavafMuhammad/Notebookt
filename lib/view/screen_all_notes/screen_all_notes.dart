import 'package:flutter/material.dart';
import 'package:note_app/constant/const.dart';
import 'package:note_app/data/data.dart';
import 'package:note_app/data/note_model/note_model.dart';
import 'package:note_app/view/screen_add_note/screen_add_note.dart';
import 'package:note_app/view/screen_all_notes/note_item_widget.dart';

class ScreenAllNotes extends StatelessWidget {
  const ScreenAllNotes({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NoteDB.instance.refreshUI();
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          shadowColor: kColorBlack,
          backgroundColor: const Color.fromARGB(210, 2, 87, 129),
          title: const Text(
            'Notebookt',
            style: kAppbarTextStyle,
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: NoteDB.instance.noteListNotifier,
          builder: (BuildContext context, List<NoteModel> newList, Widget? _) {
            if (newList.isEmpty) {
              return const Center(
                child: Text('No Notes'),
              );
            }
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: List.generate(newList.length, (index) {
                final note = NoteDB.instance.noteListNotifier.value[index];
                if (note.id == null) {
                  return const SizedBox();
                }
                return NoteItem(
                  id: note.id!,
                  title: note.title ?? 'No Title Found',
                  content: note.content ?? 'No Content Found',
                );
              }),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => ScreenAddNote(type: ActionType.addNote)));
            },
            label: const Text('New Note', style: TextStyle(fontSize: 15),)),
      ),
    );
  }
}
