import 'package:flutter/material.dart';
class ScrollHandel extends StatelessWidget {
  const ScrollHandel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 5,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
