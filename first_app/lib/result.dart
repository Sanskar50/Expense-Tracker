import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalscore;
  final VoidCallback rquiz;

  Result(this.totalscore, this.rquiz);

  String get ftext {
    final String s;
    if (totalscore == 3) {
      s = "Hurrah! You got all answers correct";
    } else {
      s = "Alas! You got some answers wrong";
    }
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(ftext,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          TextButton(
            child: Text("Restart"),
            style: TextButton.styleFrom(
                backgroundColor: Colors.green, foregroundColor: Colors.white),
            onPressed: rquiz,
          ),
        ],
      ),
    );
  }
}
