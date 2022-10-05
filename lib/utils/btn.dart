import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  String btnName;
  double hight;
  double whith;
  void Function()? click;
  Btn(
      {Key? key,
      required this.btnName,
      required this.hight,
      required this.whith,
      required this.click})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Container(
          height: hight,
          width: whith,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          child: Text(
            btnName,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        onPressed: click );
  }
}
