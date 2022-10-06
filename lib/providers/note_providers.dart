import 'package:flutter/material.dart';
import 'package:notes/Models/note.dart';
import 'package:hive_flutter/adapters.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = <Note>[];

  List<Note> get getNotes {
    return _notes;
  }
  //
  // final _myBox = Hive.box('myBox');

  NoteProvider() {
    addNote("first note", "this is my first note");
  }

  void addNote(String titel, String content) {
    Note note = Note(title: titel, content: content);
    _notes.add(note);
    // _notes = _myBox.get("NOTES");
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

  // void updateDatabase(){
  //   _myBox.put("NOTES", _notes);
  // }
}
