import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes/Models/note.dart';
import 'package:notes/pages/AddNoteScreen.dart';
import 'package:notes/providers/note_providers.dart';
import 'package:notes/utils/baner.dart';
import 'package:notes/utils/btn.dart';
import 'package:notes/utils/handel.dart';
import 'package:notes/utils/noteBox.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Baner(),
          DraggableScrollableSheet(
              initialChildSize: 0.655,
              //maxChildSize: 0.8,
              minChildSize: 0.655,
              builder: (context, controller) => Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Consumer<NoteProvider>(
                      builder: (context, NoteProvider data, child) {
                    return ListView.builder(
                        controller: controller,
                        itemCount: data.getNotes.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                //todo: "edit note"
                                // Navigator.push(
                                //   context,
                                //   CupertinoPageRoute(
                                //       builder: (context) => AddNotePage()),
                                // );
                              },
                              onLongPress: () {
                                //todo: "delete note"

                              },
                              child: Column(
                                children: [
                                  NoteBox(
                                    width: width - 10,
                                    note: data.getNotes[index],
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
                                                bottomRight:
                                                    Radius.circular(20))),
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      onPressed: (){
                                        Provider.of<NoteProvider>(context,
                                            listen: false)
                                            .deleteNote(index);
                                      },
                                    ),
                                  )
                                ],
                              ));
                        });
                  }))),
          Positioned(
            width: width,
            bottom: 30,
            child: Btn(
                btnName: "Add Note",
                hight: 30,
                whith: 120,
                click: () {
                  //todo "Add note"
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => AddNotePage()),
                  );
                }),
          )
        ],
      ),
    );
  }
}
