import 'package:hive_flutter/adapters.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('myBox');

  //run this whane first time ever opening the app
  void createInitialData() {
    toDoList = [
      ["Notes App -v0.0.1", "This app use your local mobile storage for  your Notes on place of online cloud storage for providing more secure"],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _myBox.get("NOTELIST");
  }

  //update the database
  void updateDatabase() {
    _myBox.put("NOTELIST", toDoList);
  }
}
