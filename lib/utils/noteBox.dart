import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes/utils/noteBox.dart';

class NoteBox extends StatelessWidget {
  String titel;
  String note;
  //void Function()? delete;
  NoteBox(
      {Key? key, required this.titel, required this.note, /*required this.delete*/ })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                titel,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                note,
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
              //         height: 20,
              //         width: 20,
              //         child: CupertinoButton(
              //           onPressed: delete,
              //           child: SvgPicture.asset("assets/delete.svg"),
              //         )),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
