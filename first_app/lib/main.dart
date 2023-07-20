// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

var tscore = 0;

class _MyAppState extends State<MyApp> {
  void _answerchosen(int score) {
    tscore += score;
    setState(() {
      i = i + 1;
    });
  }

  void resetquiz() {
    setState(() {
      i = 0;
      tscore = 0;
    });
  }

  var i = 0;
  String answer = ' ';
  var ques = [
    {
      'q': 'What is real name of Amir Khan in 3 Idiots',
      'a': [
        {'txt': 'Ranchodas', 'score': 0},
        {'txt': 'Rancho', 'score': 0},
        {'txt': 'Funsuk', 'score': 1},
        {'txt': 'Chote', 'score': 0}
      ],
    },
    {
      'q': 'What is the name of the engineering college in 3 Idiots',
      'a': [
        {'txt': 'IIC', 'score': 0},
        {'txt': 'ICCE', 'score': 0},
        {'txt': 'IIM', 'score': 0},
        {'txt': 'ICE', 'score': 1},
      ],
    },
    {
      'q': 'How many patterns did Rancho had ',
      'a': [
        {'txt': '400', 'score': 1},
        {'txt': '300', 'score': 0},
        {'txt': '100', 'score': 0},
        {'txt': '200', 'score': 0}
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
            ),
            body: i < 3
                ? Quiz(ques, _answerchosen, i)
                : Result(tscore, resetquiz)));
  }
}
