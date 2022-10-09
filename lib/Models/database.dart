import 'package:hive_flutter/adapters.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('myBox');

  //run this whane first time ever opening the app
  void createInitialData() {
    toDoList = [
      ["Titel", "Content"],
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
