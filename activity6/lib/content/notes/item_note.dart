import 'package:fire_notes_app/create_form/edit_note_form.dart';
import 'package:flutter/material.dart';

class ItemNote extends StatelessWidget {
  final Map<String, dynamic> noteContent;
  final String noteId;

  ItemNote({super.key, required this.noteContent, required this.noteId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // color: noteContent["color"],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(noteContent["data"]["title"]),
                ],
              ),
              Column(
                children: [
                  MaterialButton(
                    color: Color.fromARGB(255, 235, 181, 244),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => EditNoteForm(
                            noteContent: noteContent,
                            noteId: noteId,
                          ),
                        ),
                      );
                    },
                    child: Text("Editar nota"),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Expanded(child: Text(noteContent["data"]["details"]))],
          )
        ],
      ),
    );
  }
}
