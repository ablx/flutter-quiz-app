import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';
import 'package:flutter_quiz_app/result.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

// kann immer neu gebaut werden
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

// Persistent
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Blue', 'score': 5},
        {'text': 'Yellow', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 6},
        {'text': 'Snake', 'score': 5},
        {'text': 'Pokemon', 'score': 1},
      ]
    },
    {
      'questionText': 'Who is your favourite instructor?',
      'answers': [
        {'text': '1', 'score': 10},
        {'text': '2', 'score': 6},
        {'text': '3', 'score': 5},
        {'text': '4', 'score': 1},
      ]
    },
  ];

  // underscore => private
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    print(_questionIndex);
    print(_questions.length);
    _totalScore += score;
    setState(() {
      if (_questionIndex < _questions.length) {
        _questionIndex = _questionIndex + 1;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Title!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _answerQuestion, _questionIndex)
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
