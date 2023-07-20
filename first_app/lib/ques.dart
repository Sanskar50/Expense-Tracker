import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String ques;

  const Question(this.ques);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        ques,
        style: const TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }
}
