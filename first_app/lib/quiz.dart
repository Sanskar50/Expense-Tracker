import 'package:flutter/material.dart';
import './ans.dart';
import './ques.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function ansques;
  final int id;

  Quiz(this.questions, this.ansques, this.id);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[id]['q'] as String),
        ...(questions[id]['a'] as List<Map<String, Object>>).map(
          (answer) {
            return Answer(
                () => ansques(answer['score']), answer['txt'] as String);
          },
        ).toList(),
      ],
    );
  }
}
