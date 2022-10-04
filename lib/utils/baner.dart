import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Baner extends StatelessWidget {
  const Baner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),

            Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset("assets/sun.svg"))),
            Container(
              height: 160,
              // width: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/bacgrund.png"))),
            ),
            Container(height: 90,color: Color(0xFFBFDBFB),),

          ],
        ),
      ),
    );
  }
}
