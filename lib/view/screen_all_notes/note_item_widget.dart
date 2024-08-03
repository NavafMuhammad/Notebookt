import 'package:flutter/material.dart';
import 'package:note_app/constant/const.dart';
import 'package:note_app/data/data.dart';
import 'package:note_app/view/screen_add_note/screen_add_note.dart';

class NoteItem extends StatelessWidget {
  final String id;
  final String title;
  final String content;

  const NoteItem({
    super.key,
    required this.id,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => ScreenAddNote(
                  type: ActionType.editNote,
                  id: id,
                )));
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            color: kColorWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kColorGrey800,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      NoteDB.instance.deleteNote(id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: kColorGrey800,
                    ),
                  )
                ],
              ),
              Text(
                content,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kColorBlack,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
