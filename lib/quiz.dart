import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {

  final _questions;
  final _answerQuestion;
  final _questionIndex;

  Quiz(this._questions, this._answerQuestion, this._questionIndex);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(_questions[_questionIndex]['questionText']),
        ...(_questions[_questionIndex]['answers'] as List<String>)
            .map((e) => Answer(_answerQuestion, e))
            .toList()
      ],
    );
  }
}
