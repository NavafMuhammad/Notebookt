import 'package:flutter/material.dart';
import 'package:note_app/constant/const.dart';

import 'package:note_app/data/data.dart';
import 'package:note_app/data/note_model/note_model.dart';

enum ActionType {
  addNote,
  editNote,
}

class ScreenAddNote extends StatelessWidget {
  final ActionType type;
  final String? id;

  ScreenAddNote({super.key, required this.type, this.id});

  Widget get saveButton => TextButton.icon(
        onPressed: () {
          switch (type) {
            case ActionType.addNote:
              // Add Note
              saveNote();
              break;
            case ActionType.editNote:
              // Edit Note
              saveEditedNote();
              break;
          }
        },
        icon: const Icon(
          Icons.save,
          color: kColorWhite,
        ),
        label: const Text(
          "Save",
          style: TextStyle(color: kColorWhite),
        ),
      );

  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController =
      TextEditingController();

  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (type == ActionType.editNote) {
      if (id == null) {
      } else {
        final note = NoteDB.instance.getNoteById(id!);
        if (note == null) {
        } else {
          _titleEditingController.text = note.title ?? 'No Title';
          _contentEditingController.text = note.content ?? 'No content';
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.black,
          backgroundColor: const Color.fromARGB(210, 2, 87, 129),
          title: Text(
            type.name,
            style: kAppbarTextStyle,
          ),
          actions: [
            saveButton,
          ],
        ),
        body: Column(
          children: [
            TextFormField(
              maxLines: 3,
              controller: _titleEditingController,
              style: kText18,
              decoration: const InputDecoration(
                filled: true,
                fillColor: kTextFormFieldColor,
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: 'Title',
                hintStyle: kText18,
              ),
            ),
            Expanded(
              flex: 5,
              child: TextFormField(
                style: kText18,
                maxLines: null,
                expands: true,
                controller: _contentEditingController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: kTextFormFieldColor,
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Content',
                    hintStyle: kText18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveNote() async {
    final title = _titleEditingController.text;
    final content = _contentEditingController.text;

    final newNoteModel = NoteModel.create(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
    );

    final newNote = await NoteDB.instance.createNote(newNoteModel);
    if (newNote != null) {
      Navigator.of(_scaffoldKey.currentContext!).pop();
      NoteDB.instance.refreshUI();
    } else {}
  }

  Future<void> saveEditedNote() async {
    final title = _titleEditingController.text;
    final content = _contentEditingController.text;

    final noteModel = NoteModel.create(
      id: id,
      title: title,
      content: content,
    );
    final editedNote = await NoteDB.instance.updateNote(noteModel);
    if (editedNote != null) {
      Navigator.of(_scaffoldKey.currentContext!).pop();
      NoteDB.instance.refreshUI();
    } else {}
  }
}
