import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes/Models/note.dart';

class NoteBox extends StatelessWidget {
  // String titel;
  // String note;
  double width;
  // void Function()? delete;
  final Note note;
  NoteBox({Key? key, required this.note, required this.width
      /*required this.titel, required this.note, required this.delete*/
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SelectableText(
                note.title,
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
                note.content,
                style: TextStyle(fontSize: 15),
              ),

              SizedBox(
                height: 10,
              ),
              //Delete
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     SizedBox(
              //       height: 20,
              //       width: 20,
              //       // child: CupertinoButton(
              //       //   onPressed: delete,
              //       //   child: SvgPicture.asset("assets/delete.svg"),
              //       // )),
              //       child: GestureDetector(
              //         onTap: () {},
              //         child: Icon(
              //           Icons.delete,
              //         ),
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
