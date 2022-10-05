import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes/pages/AddNoteScreen.dart';
import 'package:notes/utils/baner.dart';
import 'package:notes/utils/btn.dart';
import 'package:notes/utils/handel.dart';
import 'package:notes/utils/noteBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> str = [
    "Note taking is, essentially, the practice of recording information captured from another source.",
    "The definition of a note is a brief piece of writing usually recorded to inform or remind. An example of a note is someone leaving a piece of paper with buy milk written on it attached to the refrigerator. Note taking is, essentially, the practice of recording information captured from another source. Note taking is, essentially, the practice of recording information captured from another source. Note taking is, essentially, the practice of recording information captured from another source.",
    "A title is one or more words used before or after a person's name, in certain contexts."
  ];

  List<String> titel = ["Titel", "Story", "Note"];

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
                    child: ListView.builder(
                        controller: controller,
                        itemCount: str.length,
                        itemBuilder: (context, index) {
                          // final  = str[index];
                          // return Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.circular(20)),
                          //     child: Padding(
                          //       padding: const EdgeInsets.all(15.0),
                          //       child: Column(
                          //         children: [
                          //           SizedBox(
                          //             height: 10,
                          //           ),
                          //           Text(
                          //             titel[index],
                          //             textAlign: TextAlign.start,
                          //             style: TextStyle(
                          //               fontSize: 20,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             height: 15,
                          //           ),
                          //           Text(
                          //             str[index],
                          //             style: TextStyle(fontSize: 15),
                          //           ),
                          //           SizedBox(
                          //             height: 10,
                          //           ),
                          //           //Delete
                          //           Row(
                          //             mainAxisAlignment: MainAxisAlignment.end,
                          //             children: [
                          //               SizedBox(
                          //                   height: 20,
                          //                   width: 20,
                          //                   child: SvgPicture.asset(
                          //                       "assets/delete.svg")),
                          //             ],
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // );

                          return GestureDetector(
                              onTap: () {
                                //todo: "edit note"
                              },
                              onLongPress: () {
                                //todo: "delete note"
                                str.removeAt(index);
                                titel.removeAt(index);
                              },
                              child: NoteBox(
                                  titel: titel[index], note: str[index]));
                        }),
                  )),
          Positioned(
            width: width,
            bottom: 30,
            child: Btn(
                btnName: "Add Note",
                hight: 30,
                whith: 120,
                click: () {
                  //todo "Add note"
                }),
          )
        ],
      ),
    );
  }
}
