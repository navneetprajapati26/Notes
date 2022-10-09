import 'package:flutter/material.dart';
import 'package:notes/providers/note_providers.dart';
import 'package:notes/utils/btn.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatelessWidget {
  final controllerTitel;
  final controllerNote;
  VoidCallback onSave;

  AddNotePage({
    Key? key,
    required this.controllerTitel,
    required this.controllerNote,
    required this.onSave,
  }) : super(key: key);

  // TextEditingController ttCont = TextEditingController();
  //
  // TextEditingController noteCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double higit = MediaQuery.of(context).size.height;
    String titelText = "titel";
    String descriptionText = "note";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFD9D9D9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: higit - 130,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 5, right: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: controllerTitel,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFD9D9D9))),
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    // onChanged: (value) {
                    //   titelText = value;
                    // },
                  ),
                  //SizedBox(height: 15,),
                  Container(
                    height: 400,
                    alignment: Alignment.topRight,
                    child: ListView(
                      children: [
                        TextField(
                          controller: controllerNote,
                          maxLines: null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Write your note",
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  //fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFD9D9D9))),
                          style: TextStyle(
                              //fontSize: 20,
                              // fontWeight: FontWeight.bold,
                              color: Colors.black),
                          // onChanged: (value) {
                          //   descriptionText = value;
                          // },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Btn(
            btnName: "Save",
            hight: 30,
            whith: 120,
            click: onSave
            //     () {
            //   Provider.of<NoteProvider>(context, listen: false)
            //       .addNote(ttCont.text, noteCont.text);
            //   Navigator.pop(context);
            //
            // },
          )
        ],
      ),
    );
  }
}
