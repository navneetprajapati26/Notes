import 'package:flutter/material.dart';
import 'package:notes/Models/note.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = <Note>[];

  List<Note> get getNotes {
    return _notes;
  }

  NoteProvider() {
    addNote("first note", "this is my first note");
  }

  void addNote(String titel, String content) {
    Note note = Note(title: titel, content: content);
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(int index) {
    //ToDo "Update note"
  }

  void deleteNote(int index) {
    //ToDo "Delete note"
    _notes.removeAt(index);
    notifyListeners();
  }
}
