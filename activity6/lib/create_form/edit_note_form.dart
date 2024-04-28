import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_notes_app/create_form/notes_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EditNoteForm extends StatefulWidget {
  final Map<String, dynamic> noteContent;
  final String noteId;

  EditNoteForm({super.key, required this.noteContent, required this.noteId});

  @override
  State<EditNoteForm> createState() => _NewNoteFormState();
}

class _NewNoteFormState extends State<EditNoteForm> {
  var _titleC;
  var _descrC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final title = widget.noteContent['data']?['title'] ?? '';
    final details = widget.noteContent['data']?['details'] ?? '';

    _titleC = TextEditingController(text: title);
    _descrC = TextEditingController(text: details);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar nota"),
      ),
      body: Consumer<NotesProvider>(
        builder: (context, notesProvider, child) {
          if (notesProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else
            return Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: [
                  SizedBox(height: 24),
                  notesProvider.getSelectedImage != null
                      ? Image.file(notesProvider.getSelectedImage!)
                      : Container(),
                  TextField(
                    controller: _titleC,
                    decoration: InputDecoration(
                      label: Text("Title"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: _descrC,
                    decoration: InputDecoration(
                      label: Text("Descripcion"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),
                  SizedBox(height: 24),
                  MaterialButton(
                    child: Text("Seleccionar imagen"),
                    onPressed: () {
                      // TODO: hacer que el provider abra camara para tomar foto
                    },
                  ),
                  MaterialButton(
                    child: Text("Guardar Cambios"),
                    color: Colors.green,
                    onPressed: () async {
                      Map<String, dynamic> noteContent = {};

                      noteContent = {
                        "data": {
                          "details": _descrC.text,
                          "title": _titleC.text,
                        }
                      };
                      notesProvider
                          .editExistingNote(widget.noteId, noteContent)
                          .then((success) {
                        if (success) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text("Guardado con exito!!"),
                              ),
                            );
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text("No se pudo guardar!!"),
                              ),
                            );
                        }
                      });
                    },
                  ),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      notesProvider
                          .removeExistingNote(widget.noteId)
                          .then((success) {
                        if (success) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text("Eliminada con exito!!"),
                              ),
                            );
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text("No se pudo eliminar!!"),
                              ),
                            );
                        }
                      });
                    },
                    child: Text("Eliminar Nota"),
                  )
                ],
              ),
            );
        },
      ),
    );
  }
}
