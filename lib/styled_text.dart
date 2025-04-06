import 'package:flutter/material.dart';

//this is about creating own widget and calling it in class file
class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text; //adding final tells that it will never change in future

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 28,
      ),
    );
  }
}
