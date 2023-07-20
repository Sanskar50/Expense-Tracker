import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback ans;
  final String txt;

  Answer(this.ans, this.txt);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        onPressed: ans,
        child: Text(txt),
      ),
    );
  }
}
