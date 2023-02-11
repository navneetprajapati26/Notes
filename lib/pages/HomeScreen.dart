import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/pages/AddNoteScreen.dart';
import 'package:notes/utils/baner.dart';
import 'package:notes/utils/btn.dart';
import '../Models/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //reference of hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();
  final _controllerTitel = TextEditingController();
  final _controllerNote = TextEditingController();

  void initState() {
    // whene first time
    if (_myBox.get("NOTELIST") == null) {
      db.createInitialData();
    } else {
      // alredy
      db.loadData();
    }
    super.initState();
  }

  // Save new task
  void saveNewNote() {
    setState(() {
      db.toDoList.add([_controllerTitel.text, _controllerNote.text]);
      _controllerTitel.clear();
      _controllerNote.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // create New Task
  void createNewTask() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddNotePage(
                  controllerTitel: _controllerTitel,
                  controllerNote: _controllerNote,
                  onSave: saveNewNote,
                )));
  }


  // delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Baner(),
          DraggableScrollableSheet(
              initialChildSize: 0.677,
              //maxChildSize: 0.8,
              minChildSize: 0.677,
              builder: (context, controller) => Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: ListView.builder(
                        controller: controller,
                        // itemCount: data.getNotes.length,
                        itemCount: db.toDoList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onDoubleTap: () {
                                  //todo dubel tap edit
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, top: 8, right: 8),
                                  child: Container(
                                    width: width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SelectableText(
                                            //note.title,
                                            db.toDoList[index][0],
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          SelectableText(
                                            db.toDoList[index][1],
                                            //todo Content
                                            // note.content,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 0, right: 8),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    width: width - 10,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF3C4043),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    deleteTask(index);
                                    // Provider.of<NoteProvider>(context,
                                    //     listen: false)
                                    //     .deleteNote(index);
                                  },
                                ),
                              )
                            ],
                          );
                        }),
                  )),
          Positioned(
            width: width,
            bottom: 30,
            child: Btn(
                btnName: "Add Note",
                hight: 30,
                whith: 120,
                click: createNewTask),
          )
        ],
      ),
    );
  }
}
