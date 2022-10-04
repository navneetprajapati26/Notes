import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Delete extends StatelessWidget {
  const Delete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        width: 90,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(7)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Delete"),
            SizedBox(width: 7,),
            SizedBox(
                height: 15,
                width: 15,
                child: SvgPicture.asset("assets/delete.svg")),
          ],
        )

    );
  }
}
