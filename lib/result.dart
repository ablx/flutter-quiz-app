import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final _totalScore;
  final Function _restartQuiz;

  Result(this._totalScore, this._restartQuiz);

  String get resultPhrase {
    var resultText = 'You did it! Score $_totalScore ';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: _restartQuiz, child: Text('Restart quiz'))
      ],
    ));
  }
}
